# My Fish Shell Configuration

This repository contains my personal configuration files for the [Fish shell](https://fishshell.com/).

## Overview

This setup aims for a clean, efficient, and customized Fish shell environment. It leverages Fish's features like autoloading functions and the `conf.d` directory for modular configuration.

## Structure

The configuration is organized into the following main files and directories:

*   **`config.fish`**: The main entry point for the Fish configuration. It primarily sources other configuration files and sets the theme.
*   **`conf.d/`**: Contains configuration snippets that are automatically sourced by Fish in alphabetical order. This is used for setting environment variables, modifying the PATH, initializing tools, and defining aliases.
    *   `00_env_vars.fish`: Sets up initial environment variables, potentially based on the operating system.
    *   `10_path.fish`: Modifies the `$PATH` variable to include custom binary locations.
    *   `30_tools.fish`: Configures various command-line tools like `fzf`, `yarn`, `fnm`, `direnv`, etc.
    *   `40_aliases.fish` (Recommended location): Contains custom shell aliases.
*   **`functions/`**: Holds custom Fish functions. Fish automatically loads `.fish` files in this directory when the corresponding function is called for the first time.
*   **`themes/`**: Contains custom Fish themes. The active theme (`Nordic.theme` in this case) is usually selected in `config.fish`.
*   **`secrets.fish`**: (Optional, **should be gitignored**) Used for sourcing sensitive information like API keys or private environment variables. This file is sourced by `config.fish` if it exists.

## Key Features & Tools

This configuration includes setup for:

*   **Environment Variables:** Sensible defaults and OS-specific settings.
*   **PATH Management:** Cleanly adds necessary directories to the execution path.
*   **Node.js Environment:** `fnm` integration.
*   **Developer Tools:** Configuration for `fzf` (fuzzy finder), `yarn` (package manager), `direnv` (directory-specific environments).
*   **Custom Prompt:** Defined in `functions/fish_prompt.fish`.
*   **Theme:** Uses the `Nordic` theme.

## Customization

*   **Aliases:** Add new aliases to `conf.d/aliases.fish`.
*   **Functions:** Create new `.fish` files in the `functions/` directory, one file per function, named after the function (e.g., `my_function.fish` for `function my_function`).
*   **Environment Variables:** Add new variables to `conf.d/00_env_vars.fish` or create a new file in `conf.d/` (e.g., `90_custom_vars.fish`).
*   **Secrets:** Add sensitive data to `secrets.fish` (ensure this file is in your `.gitignore`).

## Installation

```sh
git clone https://github.com/brunoarueira/fish-scripts ~/.config/fish
```

## Functions

| Name               | Arguments       | Description                                                      |
| ------------------ | --------------- | ---------------------------------------------------------------- |
| `-`                |                 | `cd -`, return to the previous path                              |
| `cleanup-asl-log`  |                 | Remove `*.asl` from `/private/var/log/asl/`                      |
| `csv-show`         | `csv file path` | Show CSV file content on the console                             |
| `export`           | `VAR=value`     | Like `export` in bash                                            |
| `extract`          | `archive_file`  | Extract various archive types                                    |
| `fish_prompt`      |                 | Defines the custom fish prompt                                   |
| `kcontext`         | `[context]`     | List contexts to switch after select it                          |
| `kdpod`            | `namespace`     | Describe pod through kubectl on the specified namespace          |
| `kexec`            | `namespace`     | Access the terminal on pods at the specified namespace           |
| `klogs`            | `namespace`     | Access logs through kubectl from pods on the specified namespace |
| `last_modified`    | `[path]`        | Shows last modified files/dirs                                   |
| `mk`               | `process_name`  | Monster kill a process                                           |
| `psg`              | `process_name`  | List processes matching `process_name`                           |
| `sdk`              | `[sdk_cmd]`     | sdkman                                                           |
| `ssm`              | `[ssm_cmd]`     | Connect through aws ssm to instances on ec2                      |
| `toggle`           | `app_name`      | Toggle the visibility of an application on MacOS                 |

## Contributing

1. Fork it ( https://github.com/brunoarueira/fish-scripts/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
