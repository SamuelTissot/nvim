vim.api.nvim_set_keymap(
	"n",
	"<leader>ci",
	[[<cmd>lua require'telescope'.extensions.goimpl.goimpl{}<CR>]],
	{ noremap = true, silent = true, desc = "[C]reate [I]implementation" }
)

-- command	Description
-- GoInstallBinary go_binary_name	use go install go_binary_url@latest to install tool, if installed will skip
-- GoUpdateBinary go_binary_name	use go install go_binary_url@latest Will force re-install/update if already installed, otherwise same as GoInstallBinary
-- GoInstallBinaries	use go install to install all tools, skip the ones installed
-- GoUpdateBinaries	use go install to update all tools to the latest version
-- Build and test
-- command	Description
-- GoMake	async make, use with other commands
-- GoBuild args	go build args (-g: enable debug, %: expand to current file, %:h expand to current package)
-- GoGenerate
-- GoRun {args} -a {cmd_args}	e.g. GoRun equal to go run .; or GoRun ./cmd equal to go run ./cmd, Additional args: -F run in floaterm
-- GoRun -a {cmd_args}	specify additional arguments pass to your main(), see notes 3
-- GoStop {job_id}	stop the job started with GoRun
-- GoTest	go test ./...
-- GoTestSum {pkgname} {gotestsum arguments}	run gotestsum and show result in side panel
-- GoTestSum -w	run gotestsum in watch mode
-- GoTest -v	go test -v current_file_path
-- GoTest -c	go test -c current_file_path
-- GoTest -n	test nearest, see GoTestFunc
-- GoTest -f	test current file, see GoTestFile
-- GoTest -n 1	-count=1 flag
-- GoTest -p {pkgname}	test package, see GoTestPkg, test current package if {pkgname} not specified
-- GoTest -parallel {number}	test current package with parallel number
-- GoTest -b {build_flags}	run go test with build flags e.g. -b -gcflags="all-N\ -l"
-- GoTest -t yourtags	go test ./... -tags=yourtags, see notes
-- GoTest -F ./... | awk '{$1=$1};1' | delta	pipe the test output to awk and then delta/diff-so-fancy to show diff output of go test (e.g. testify)
-- GoTest -a your_args	go test ./... -args=yourargs, see notes
-- GoTest package_path -t yourtags	go test packagepath -tags=yourtags
-- GoTest package_path -t yourtags other_args	go test packagepath -tags=yourtags other_args
-- GoLint	golangci-lint
-- GoGet {package_url}	go get package_url and restart gopls. Note1
-- GoVet	go vet
-- GoWork {run	use} {pkgpath}
-- GoCoverage	go test -coverprofile
-- GoCoverage -p	go test -coverprofile (only tests package for current buffer)
-- GoCoverage -f coverage_file_name	load coverage file
-- GoCoverage {flags}	-t : toggle, -r: remove signs, -R remove sings from all files, -m show metrics
-- GoCoverage {flags} {go test flags}	e.g: GoCoverage -p -coverpkg 'yourpackagename'
-- GoTermClose	closes the floating term
-- GoTestFunc	run test for current func
-- GoTestFunc -s	select the test function you want to run
-- GoTestFunc -tags=yourtag	run test for current func with -tags yourtag option
-- GoTestFile	run test for current file
-- GoTestFile -tags=yourtag	run test for current folder with -tags yourtag option
-- GoTestPkg	run test for current package/folder
-- GoTestPkg -tags=yourtag	run test for current folder with -tags yourtag option
-- GoAddTest [-parallel]	Add test for current func
-- GoAddExpTest [-parallel]	Add tests for exported funcs
-- GoAddAllTest [-parallel]	Add tests for all funcs

vim.keymap.set("n", "<leader>aie", "<cmd>GoIfErr<CR>", { desc = "Go [A]dd [I]f [E]rror" })
vim.keymap.set("n", "<leader>asf", "<cmd>GoFillStruct<CR>", { desc = "Go [A]dd [S]truct [F]ill" })
vim.keymap.set("n", "<leader>aw", "<cmd>GoFillSwitch<CR>", { desc = "Go [A]dd s[W]witch" })
vim.keymap.set("n", "<leader>at", "<cmd>GoAddTest<CR>", { desc = "Go [A]dd [T]est" })
vim.keymap.set("n", "<leader>ad", function()
	lua.require("go.comment").gen()
end, { desc = "Go [A]dd [D]ocumentation" })
