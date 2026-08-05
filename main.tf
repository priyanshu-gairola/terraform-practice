resource "local_file" "myfile" {
  filename = "automate.txt"
  content  = "This is a file amde using terraform automation "
}
