all: evince eog

evince:
	git clone https://gitlab.gnome.org/GNOME/evince.git evince
	cd evince && git checkout 3a8954af85cdba5aa74fb497ff8572c118302f85
	cd evince && git apply ../evince.diff
	cd evince && meson build && cd build && ninja

eog:
	git clone https://gitlab.gnome.org/GNOME/eog.git
	cd eog && git checkout 37576db156eebbfdd61d9c6bcc1cde4d99be75c9
	cd eog && git apply ../eog.diff
	cd eog && meson build && cd build && ninja

install:
	cd evince/build && ninja install
	cd eog/build && ninja install
