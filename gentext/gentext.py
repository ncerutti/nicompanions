import os
import argparse
import pyperclip


def generate_project_text(folder_path, extensions, allfiles):
    exclude_dirs = [".gentext_venv", "__pycache__", ".git", ".venv"]
    exclude_files = ["__init__.py"]

    project_text = ""

    for root, dirs, files in os.walk(folder_path):
        dirs[:] = [d for d in dirs if d not in exclude_dirs]
        if allfiles:
            files = [f for f in files]
        else:
            files = [
                f
                for f in files
                if f not in exclude_files and any(f.endswith(ext) for ext in extensions)
            ]

        level = root.replace(folder_path, "").count(os.sep)
        indent = "    " * level

        project_text += f"{indent}{os.path.basename(root)}/\n"

        for file in files:
            project_text += f"{indent}    {file}\n"

            try:
                with open(os.path.join(root, file), "r", encoding="utf-8") as f:
                    file_content = f.read()
            except UnicodeDecodeError:
                try:
                    with open(os.path.join(root, file), "r", encoding="latin-1") as f:
                        file_content = f.read()
                except UnicodeDecodeError:
                    file_content = "Error: Unable to decode file content."
            except (PermissionError, FileNotFoundError):
                file_content = "Error: Permission denied or file not found."

            project_text += f"\n{file_content}\n\n"

    return project_text.strip()


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Generate project text.")
    parser.add_argument(
        "--i", dest="folder_path", default=".", help="Path to the project folder"
    )
    parser.add_argument(
        "--files",
        dest="extensions",
        nargs="+",
        default=[".py", ".sh"],
        help="File extensions to include (default: .py; all for all files)",
    )
    parser.add_argument(
        "--allfiles",
        dest="allfiles",
        action="store_true",
        default=False,
        help="Include all file extensions and ignores none",
    )
    parser.add_argument("--o", dest="output_file", help="Output file name (optional)")

    args = parser.parse_args()

    project_text = generate_project_text(
        args.folder_path, args.extensions, args.allfiles
    )

    if args.output_file:
        with open(args.output_file, "w") as f:
            f.write(project_text)
        print(f"Project text file generated: {args.output_file}")
    else:
        pyperclip.copy(project_text)
        print("Project text copied to clipboard.")
