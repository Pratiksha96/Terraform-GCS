provider "google" {
    credentials = "${file(var.key_file_path)}"
    project = "${var.project_id}"
    zone = "${var.zone}"
    region = "${var.region}"
}