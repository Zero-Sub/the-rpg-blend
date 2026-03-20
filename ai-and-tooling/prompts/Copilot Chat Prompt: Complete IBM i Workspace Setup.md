# Copilot Chat Prompt: Complete IBM i Workspace Setup

## Quick Overview

1. **Create folders** on your disk (using PowerShell/Bash commands)
2. **Copy a prompt** into Copilot Chat
3. **Get file contents** as output
4. **Paste contents** into the pre-created files
5. **Done!** Your workspace is ready

---

## Copy & Paste This Prompt into GitHub Copilot Chat

### Ultra-Condensed Prompt (SHORTEST - Use This if Still Too Long!)

**If the condensed version still hits length limit, use this ultra-short version:**

```
Create IBM i RPG workspace for: Dev: [YOUR NAME], Email: [YOUR EMAIL], Project: [PROJECT NAME]
Folder Location: [FOLDER_PATH]

STEP 1 - Create folders (PowerShell commands):
mkdir [FOLDER_PATH]\src\rpg, [FOLDER_PATH]\src\cl, [FOLDER_PATH]\src\sql, [FOLDER_PATH]\src\dds, [FOLDER_PATH]\tests, [FOLDER_PATH]\docs, [FOLDER_PATH]\build, [FOLDER_PATH]\scripts, [FOLDER_PATH]\.vscode

STEP 2 - Provide complete file contents for:
1. .vscode/settings.json (14pt font, auto-save, tab 2, RPG/CL format)
2. .vscode/launch.json (IBM i debug)
3. .gitignore (.o, .mod, build/)
4. src/rpg/TEMPLATE.RPGLE (free-form, error handling, author [YOUR NAME])
5. src/cl/TEMPLATE.CLP (CL template)
6. README.md (author [YOUR NAME], email [YOUR EMAIL])
7. DEVELOPER_GUIDE.md (standards, workflow)
8. scripts/build.ps1 (Windows compile script)
9. scripts/build.sh (Linux/Mac compile script)

Output: Complete, copy-paste-ready file contents for each file.
```

---

### Condensed Workspace Setup Prompt (Use This One!)

**Use this shorter version - the full prompt above is too long for Copilot.**

```
Create IBM i RPG VS Code workspace for: Developer: [YOUR NAME], Email: [YOUR EMAIL], Project: [YOUR PROJECT NAME]
Folder Location: [FOLDER_PATH]

STEP 1 - Folder creation commands:
PowerShell: mkdir [FOLDER_PATH]\src\rpg, [FOLDER_PATH]\src\cl, [FOLDER_PATH]\src\sql, [FOLDER_PATH]\src\dds, [FOLDER_PATH]\tests, [FOLDER_PATH]\docs, [FOLDER_PATH]\build, [FOLDER_PATH]\scripts, [FOLDER_PATH]\.vscode
Bash: mkdir -p [FOLDER_PATH]/{src/{rpg,cl,sql,dds},tests,docs,build,scripts,.vscode}

STEP 2 - Generate complete file contents:

Configuration Files:
- .vscode/settings.json (font 14pt editor/12pt terminal, auto-save, tab 2, format on save)
- .vscode/launch.json (IBM i debug configuration)
- .gitignore (ignore .o, .mod, build/ files)
- .editorconfig (formatting consistency)

Templates:
- src/rpg/TEMPLATE.RPGLE (free-form RPG with error handling, MEDHOST standards, author [YOUR NAME])
- src/cl/TEMPLATE.CLP (CL program template)
- src/sql/TEMPLATE.SQL (SQL examples)
- src/dds/TEMPLATE.DSPF (display file template)
- tests/TEST_TEMPLATE.RPGLE (test program template)

Documentation:
- README.md (project overview, setup instructions, author [YOUR NAME], email [YOUR EMAIL])
- DEVELOPER_GUIDE.md (coding standards, workflow, troubleshooting)
- ARCHITECTURE.md (system design overview)
- CHANGELOG.md (version tracking)
- CONTRIBUTING.md (team guidelines)

Build Scripts:
- scripts/build.ps1 (Windows PowerShell compilation script)
- scripts/build.sh (Linux/Mac bash compilation script)
- scripts/test.ps1 (Windows test runner)
- scripts/test.sh (Linux/Mac test runner)

Output: Provide complete, copy-paste-ready contents for EACH file above. Include file path and full content.
```

---

## How to Use This Prompt

### ⚠️ IMPORTANT: Choose the Right Version

**Three versions available - try these in order:**

1. **Ultra-Condensed (RECOMMENDED)** - Shortest, safest option
2. **Condensed** - Medium length
3. **Full prompt** - Too long (don't use)

**Try the ULTRA-CONDENSED version first.** If it still hits length limit, troubleshoot in the section below.

### Step 1: Fill in Your Information

Edit the prompt and replace these placeholders:

```
[YOUR NAME], Email: [YOUR EMAIL], Project: [PROJECT NAME]
Folder Location: [FOLDER_PATH]
```

**Example:**
```
Dev: John Smith, Email: john.smith@company.com, Project: Customer Management System
Folder Location: C:\Users\jsmith\Documents\CustomerMgmt
```

**Folder Location Examples:**
- Windows: `C:\Users\YourName\Documents\ProjectName`
- Mac: `/Users/YourName/Documents/ProjectName`
- Linux: `/home/username/documents/projectname`

### Step 2: Copy the Ultra-Condensed Prompt

Select and copy ONLY the ultra-short prompt (the one that starts with "Create IBM i RPG workspace").

**Do NOT copy longer versions.**

### Step 3: Open Copilot Chat

In VS Code:
- Press `Ctrl+Shift+I` (or Cmd+Shift+I on Mac)
- Or click the Copilot Chat icon in sidebar

### Step 4: Paste & Run

1. Paste the prompt into Copilot Chat
2. Press Enter to send
3. Wait for response (30-60 seconds)

Copilot will provide:
- **Folder creation commands** to run in terminal
- **Complete file contents** for each file

### Step 5: Run Folder Creation Commands

Copy the folder creation command from Copilot's response and run in terminal:

**PowerShell (Windows):**
```powershell
mkdir MyProject\src\rpg, MyProject\src\cl, MyProject\src\sql, MyProject\src\dds, MyProject\tests, MyProject\docs, MyProject\build, MyProject\scripts, MyProject\.vscode
```

**Bash (Mac/Linux):**
```bash
mkdir -p MyProject/{src/{rpg,cl,sql,dds},tests,docs,build,scripts,.vscode}
```

Your folders are now created on disk.

### Step 6: Create Files from Copilot Output

For each file Copilot listed, create it and add the content:

1. **File > New File** in VS Code
2. **Copy content** from Copilot response
3. **Paste** into the new file
4. **Save** (Ctrl+S) with the correct path

**Example:**
- Copilot provides: `.vscode/settings.json` content
- Create: New file named `settings.json`
- Save it in: `.vscode/` folder
- Paste Copilot's content
- Save

---

## Important: Verify Your Information

After Copilot generates the files, **verify that your information is correct**:

### Check These Files

1. **All RPG/CL Templates:**
   ```rpgle
   // Author: [YOUR NAME]
   // Created: [DATE]
   ```
   Should show YOUR name, not placeholder

2. **README.md:**
   ```markdown
   ## Contact Information
   Developer: [YOUR NAME]
   Email: [YOUR EMAIL]
   Organization: [YOUR COMPANY]
   ```
   Should have YOUR information

3. **DEVELOPER_GUIDE.md:**
   ```markdown
   Maintained by: [YOUR NAME]
   Contact: [YOUR EMAIL]
   ```
   Should show YOUR details

4. **All Code Headers:**
   ```rpgle
   **FREE
   // ===============================================
   // Program: TEMPLATE
   // Author: [YOUR NAME]
   // Email: [YOUR EMAIL]
   ```
   Should reflect YOUR information

### If Information is Missing or Wrong

**Follow-up Copilot prompt:**
```
The workspace setup is almost complete, but I need to update the author information.

Developer Information:
- Name: [YOUR NAME]
- Email: [YOUR EMAIL]
- Organization: [YOUR COMPANY]

Please regenerate these files with the correct author information:
1. All templates in src/rpg/, src/cl/, src/sql/, src/dds/
2. README.md
3. DEVELOPER_GUIDE.md
4. All code file headers

Ensure every template and documentation file includes the correct author, email, and date.
```

---

Expect Copilot to provide:

✅ **Folder structure diagram** showing recommended organization

✅ **Complete configuration files:**
- `.vscode/settings.json` - Pre-configured for RPG/CL
- `.vscode/launch.json` - Debugging setup
- `.vscode/extensions.json` - Recommended extensions
- `.gitignore` - Version control rules

✅ **5-6 template files:**
- RPG program template with best practices
- CL program template
- SQL file template
- DDS display file template
- Test program template

✅ **4 documentation files:**
- README.md (project overview)
- DEVELOPER_GUIDE.md (how-to guide)
- ARCHITECTURE.md (system design)
- CHANGELOG.md (version history)

✅ **Build scripts:**
- PowerShell and Bash versions
- Compilation automation
- Testing scripts
- Cleanup utilities

✅ **Additional files:**
- .editorconfig (editor consistency)
- CONTRIBUTING.md (team guidelines)
- Any other useful files

---

## Alternative Shorter Prompt (If You Need Quick Setup)

Use this if you want a faster response:

```
Create a professional VS Code workspace setup for IBM i RPG development.

Include:
1. Folder structure (src/rpg, src/cl, src/sql, src/dds, tests, docs, build)
2. .vscode/settings.json for RPG development
3. .vscode/launch.json for debugging
4. .gitignore for IBM i
5. README.md template
6. RPG program template
7. CL program template
8. Test program template

Each template should be complete and ready to use, following best practices.
Output complete file contents for each.
```

---

## Step-by-Step: Creating Workspace After Copilot Response

### 1. Create Folder Structure
```
MyIBMiProject/
├── .vscode/
├── src/
│   ├── rpg/
│   ├── cl/
│   ├── sql/
│   ├── dds/
│   └── cobol/
├── tests/
├── docs/
├── build/
├── scripts/
└── README.md
```

Right-click in Explorer and create each folder.

### 2. Create Configuration Files
Inside `.vscode/` folder, create:
- `settings.json`
- `launch.json`
- `extensions.json`

Copy contents from Copilot response.

### 3. Create Template Files
In appropriate `src/` subfolders:
- `TEMPLATE.RPGLE` in src/rpg/
- `TEMPLATE.CLP` in src/cl/
- `TEMPLATE.SQL` in src/sql/
- `TEMPLATE.DSPF` in src/dds/
- `TEST_TEMPLATE.RPGLE` in tests/

### 4. Create Documentation
In project root:
- `README.md`
- `DEVELOPER_GUIDE.md`
- `ARCHITECTURE.md`
- `CHANGELOG.md`

### 5. Create Build Scripts
In `scripts/` folder:
- `build.sh` (for Mac/Linux)
- `build.ps1` (for Windows)
- `test.sh` / `test.ps1`
- `cleanup.sh` / `cleanup.ps1`

### 6. Create Additional Files
- `.editorconfig` (in root)
- `.gitignore` (in root)
- `CONTRIBUTING.md` (in root)

### 7. Initialize Git
```bash
cd MyIBMiProject
git init
git add .
git commit -m "Initial workspace setup"
```

---

## Expected Output Examples

### Example: Folder Structure from Copilot

```
MyIBMiProject/
├── .vscode/
│   ├── settings.json          (150 lines)
│   ├── launch.json            (30 lines)
│   └── extensions.json        (40 lines)
├── src/
│   ├── rpg/                   (RPG programs)
│   │   └── TEMPLATE.RPGLE     (60 lines)
│   ├── cl/                    (CL programs)
│   │   └── TEMPLATE.CLP       (30 lines)
│   ├── sql/                   (SQL queries)
│   │   └── TEMPLATE.SQL       (40 lines)
│   ├── dds/                   (Display files)
│   │   └── TEMPLATE.DSPF      (50 lines)
│   └── cobol/                 (Optional)
├── tests/
│   └── TEST_TEMPLATE.RPGLE    (80 lines)
├── docs/
│   ├── README.md              (200 lines)
│   ├── DEVELOPER_GUIDE.md     (300 lines)
│   ├── ARCHITECTURE.md        (200 lines)
│   └── CHANGELOG.md           (50 lines)
├── scripts/
│   ├── build.sh               (100 lines)
│   ├── build.ps1              (120 lines)
│   ├── test.sh                (60 lines)
│   └── cleanup.sh             (60 lines)
├── build/                     (Compiled objects)
├── .vscode/
├── .editorconfig
├── .gitignore
├── CONTRIBUTING.md
└── README.md
```

### Example: What settings.json Will Look Like

```json
{
  "editor.fontSize": 14,
  "editor.fontFamily": "Consolas, 'Courier New', monospace",
  "editor.formatOnSave": true,
  "editor.tabSize": 2,
  "editor.wordWrap": "on",
  "files.autoSave": "afterDelay",
  "files.autoSaveDelay": 1000,
  "[rpgle]": {
    "editor.tabSize": 2,
    "editor.insertSpaces": true,
    "editor.formatOnSave": true
  },
  "[cl]": {
    "editor.tabSize": 2
  },
  "terminal.integrated.fontSize": 12,
  "extensions.recommendations": [
    "Halcyon.code-for-ibmi",
    "GitHub.copilot",
    "esbenp.prettier-vscode",
    "eamodio.gitlens"
  ]
}
```

---

## Time-Saving Tips

### Batch File Creation
Instead of creating files one-by-one:

1. **Ask Copilot** for all file contents
2. **Create folder structure** manually (5 minutes)
3. **Create all files** from Copilot output (use copy/paste)
4. **Total time:** 15-20 minutes for complete setup

### Reuse Across Projects
Save your complete workspace as a **template**:

```
1. Complete setup once
2. Copy entire folder
3. Rename for new project
4. Update README.md with new project info
5. Start coding immediately
```

### Team Consistency
Share the generated workspace setup:
- Commit to Git
- All team members clone
- Everyone has identical setup
- Consistent coding experience

---

## What You Get After Running Prompt

✅ Professional folder structure
✅ All configuration files ready
✅ RPG/CL/SQL/DDS templates
✅ Complete documentation framework
✅ Automated build scripts
✅ Git integration ready
✅ Ready to start coding immediately

**Total time from empty folder to ready workspace:** 20-30 minutes

---

## Next Steps After Workspace Setup

Once your workspace is created:

1. **Connect to IBM i:**
   - Click IBM i icon
   - Click "+" to add system
   - Enter connection details

2. **Copy templates to use:**
   - Rename TEMPLATE.RPGLE to your program name
   - Use as starting point for new programs

3. **Start coding:**
   - Edit programs
   - Compile (right-click → Compile)
   - Test (terminal: call mylib/program)

4. **Commit to Git:**
   ```bash
   git add .
   git commit -m "First program: MYPROG"
   ```

---

## Troubleshooting Copilot Response

### "Response hit the length limit" Error

**What it means:** Copilot Chat couldn't finish responding because your system hit its length limit.

**Why it happens:** Different laptops/systems have different Copilot Chat limits. This is normal.

**Solution 1: Use Ultra-Condensed Prompt (Recommended)**
- Copy ONLY the ultra-short prompt at the top
- Don't use the condensed or full version
- Should work on any system

**Solution 2: Use Two Separate Prompts**

If ultra-condensed still fails, split into two:

**Prompt 1:** Folder structure + config
```
IBM i workspace folders and VS Code config.

Dev: [YOUR NAME], Email: [YOUR EMAIL], Project: [PROJECT NAME]

1. Create folders: src/rpg, src/cl, src/sql, src/dds, tests, docs, build, scripts, .vscode
2. .vscode/settings.json (14pt font, auto-save, tab 2)
3. .vscode/launch.json (IBM i debug)
4. .gitignore (.o, .mod, build/)
```

**Prompt 2:** Templates + scripts + docs
```
IBM i RPG templates and build scripts.

Author: [YOUR NAME]

1. TEMPLATE.RPGLE (free-form, error handling)
2. TEMPLATE.CLP (CL template)
3. README.md (author, email)
4. DEVELOPER_GUIDE.md (standards)
5. build.ps1 (Windows)
6. build.sh (Linux/Mac)

Output: Complete file contents.
```

### Copilot Response Incomplete

If Copilot only generated some files:

**Follow-up prompt:**
```
Provide complete contents for missing files:
- [filename1]
- [filename2]

Full, copy-paste ready content for each.
```

### Author Info Missing from Templates

**Follow-up prompt:**
```
Update all templates to include:
Author: [YOUR NAME]
Email: [YOUR EMAIL]

Add to top of each file as comments.
```

### Scripts Don't Run

**Ask Copilot:**
```
Why might build.ps1 fail on Windows? Provide fixes.
```

Or check:
1. PowerShell execution policy: `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned`
2. Bash permissions: `chmod +x build.sh`

---

**Remember:** This prompt is designed to create a complete, professional, production-ready workspace in one go. Adjust as needed for your specific requirements!
