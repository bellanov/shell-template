# shell-template

Template for general Shell script development.

The template contains examples of best practices and standards derived from the [Google Shell Style Guide](https://google.github.io/styleguide/shellguide.html).

## Requirements

- **shellcheck**: For linting shell scripts
- **bats**: For testing shell scripts (optional, only needed for running tests)

## Scripts

Summary of the available scripts and their usage. Details available within each script.

| Script      | Description |
| ----------- | ----------- |
| **lint.sh** | Lint the codebase using shellcheck. |
| **test.sh** | Run BATS tests for all examples. |

## Examples

Summary of each example. Each example demonstrates different design patterns for shell scripting.

| Example         | Description |
| --------------- | ----------- |
| **hello.sh**    | Simple example demonstrating the error handling pattern for reference. |
| **args.sh**     | Demonstrates command-line argument parsing with validation and help messages. |
| **functions.sh** | Demonstrates function organization, modularity, and composition. |
| **logging.sh**  | Demonstrates structured logging with different log levels (INFO, WARN, ERROR). |
| **config.sh**   | Demonstrates configuration management from environment variables and files. |

## Design Patterns

### Error Handling

The `hello.sh` example shows how to implement proper error handling:

```bash
err() {
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $*" >&2
  exit 1
}
```

### Argument Parsing

The `args.sh` example shows how to parse command-line arguments:

```bash
while (($# > 0)); do
  case "$1" in
    -g | --greeting)
      shift
      greeting="$1"
      ;;
    -h | --help) usage; exit 0 ;;
    *)
      name="$1"
      ;;
  esac
  shift
done
```

### Functions and Modularity

The `functions.sh` example demonstrates:

- Function documentation following Google Shell Style Guide
- Function composition for code reuse
- Clear separation of concerns

### Logging

The `logging.sh` example shows how to implement:

- Structured logging with timestamps
- Log levels (INFO, WARN, ERROR)
- Configurable logging via environment variables

### Configuration

The `config.sh` example demonstrates:

- Loading configuration from environment variables
- Loading configuration from files
- Default configuration values

## Usage

### Running Examples

Run any example script directly:

```bash
bash examples/hello.sh
bash examples/args.sh "World"
bash examples/args.sh --greeting "Hi" "Alice"
bash examples/functions.sh
bash examples/logging.sh
bash examples/config.sh
```

### Linting

Lint all shell scripts:

```bash
bash scripts/lint.sh
```

### Testing

Run all tests:

```bash
bash scripts/test.sh
```

## Contributing

When adding new examples:

1. Follow the [Google Shell Style Guide](https://google.github.io/styleguide/shellguide.html)
2. Ensure all scripts pass `shellcheck` linting
3. Add tests for new examples in the `tests/` directory
4. Update this README with descriptions of new examples and patterns