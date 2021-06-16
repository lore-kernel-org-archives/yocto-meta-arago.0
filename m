Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 6A07852B5E
	for <meta-arago@arago-project.org>;
	Wed, 16 Jun 2021 21:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2E9C140C1C
	for <meta-arago@arago-project.org>;
	Wed, 16 Jun 2021 21:31:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id jlR4Hv6R3TrZ for <meta-arago@arago-project.org>;
	Wed, 16 Jun 2021 21:31:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 10C0540B66
	for <meta-arago@arago-project.org>;
	Wed, 16 Jun 2021 21:31:25 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 715F2174603; Wed, 16 Jun 2021 17:31:24 -0400 (EDT)
Date: Wed, 16 Jun 2021 17:31:24 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Message-ID: <20210616213124.GJ1528@denix.org>
References: <1623874449-31873-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1623874449-31873-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 0/2] RFC: Add global Docker container runtime
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Jun 2021 21:30:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 16, 2021 at 04:14:07PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> This patchset adds Docker container runtime to both base and default rootfs 
> images for all platforms.
> 
> Patch 1 enables necessary kernel configs through docker.cfg config fragment. 
> This fragment can later be added to ti-linux-kernel/ti_config_fragments.
> 
> Denys Dmytriyenko (2):
>   linux-ti-staging: enable necessary configs for running docker
>     containers
>   packagegroup-arago-base: add docker runtime to the base and default
>     rootfs
> 
>  .../packagegroups/packagegroup-arago-base.bb         |  1 +
>  meta-arago-distro/recipes-kernel/linux/docker.inc    |  2 ++
>  .../linux/linux-ti-staging-rt_%.bbappend             |  1 +
>  .../linux/linux-ti-staging-systest_%.bbappend        |  1 +
>  .../recipes-kernel/linux/linux-ti-staging/docker.cfg | 20 ++++++++++++++++++++
>  .../recipes-kernel/linux/linux-ti-staging_%.bbappend |  1 +
>  6 files changed, 26 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-kernel/linux/docker.inc
>  create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-ti-staging/docker.cfg
> 
> -- 
> 2.7.4

Besides docker itself and containerd, it pulls the entire util-linux package 
in place of those provided by busybox. Here's the size increase of the base 
image:

commit 2b3d94352436af56dbed776ba3f094637fa72efc
Author: buildhistory <buildhistory@arago>
Date:   Tue Jun 15 22:28:30 2021 +0000

    Build 20210615221326 of arago 2020.09 for machine j7-evm on gimli
    
    cmd: bitbake tisdk-base-image
    
    result: succeeded
    
    metadata revisions:
    meta-arago-distro = dunfell:3a199c9117b2c7ff10fae8cc2f8813586f3d241d -- modified
    meta-arago-extras = dunfell:3a199c9117b2c7ff10fae8cc2f8813586f3d241d -- modified
    meta-qt5          = dunfell:b4d24d70aca75791902df5cd59a4f4a54aa4a125
    meta-virtualization = dunfell:8be0bc1480e649b2df5f9f8e87e01c5acbe61182
    meta-networking   = dunfell:c38d2a74f762a792046f3d3c377827b08aade513
    meta-python       = dunfell:c38d2a74f762a792046f3d3c377827b08aade513
    meta-oe           = dunfell:c38d2a74f762a792046f3d3c377827b08aade513
    meta-gnome        = dunfell:c38d2a74f762a792046f3d3c377827b08aade513
    meta-filesystems  = dunfell:c38d2a74f762a792046f3d3c377827b08aade513
    meta-ti           = dunfell:02a2433c47bf41fcd5d212a1f2dd9371e90bfe0a
    meta-arm          = HEAD:c4f04f3fb66f8f4365b08b553af8206372e90a63
    meta-arm-toolchain = HEAD:c4f04f3fb66f8f4365b08b553af8206372e90a63
    meta              = dunfell:2246b0d7a71c69eb2e89c55991d1387069895466

diff --git a/images/j7_evm/glibc/tisdk-base-image/installed-package-sizes.txt b/images/j7_evm/glibc/tisdk-base-image/installed-package-sizes.txt
index 56d326d..2f207e7 100644
--- a/images/j7_evm/glibc/tisdk-base-image/installed-package-sizes.txt
+++ b/images/j7_evm/glibc/tisdk-base-image/installed-package-sizes.txt
@@ -1,8 +1,11 @@
+119448	KiB	docker-ce
+57709	KiB	containerd-opencontainers
 18556	KiB	kernel-image-image-5.10.41-g3314837930
 9425	KiB	python3-core
-8709	KiB	kernel-image-vmlinux.gz-5.10.41-g3314837930
+8717	KiB	kernel-image-vmlinux.gz-5.10.41-g3314837930
 7318	KiB	systemd
 6664	KiB	udev-hwdb
+6354	KiB	runc-docker
 3478	KiB	libglib-2.0-0
 3130	KiB	libpython3.8-1.0
 2624	KiB	libc6
@@ -26,7 +29,7 @@
 827	KiB	libvorbis
 805	KiB	busybox
 796	KiB	kernel-module-mac80211-5.10.41-g3314837930
-750	KiB	kernel-module-ipv6-5.10.41-g3314837930
+755	KiB	kernel-module-ipv6-5.10.41-g3314837930
 725	KiB	libsystemd0
 657	KiB	kernel-module-bluetooth-5.10.41-g3314837930
 631	KiB	libfreetype6
@@ -41,6 +44,7 @@
 538	KiB	libsolv1
 499	KiB	kbd-keymaps
 498	KiB	kernel-module-cfg80211-5.10.41-g3314837930
+497	KiB	tini
 491	KiB	kernel-module-sctp-5.10.41-g3314837930
 473	KiB	kms++-python
 471	KiB	kernel-module-mpt3sas-5.10.41-g3314837930
@@ -97,6 +101,7 @@
 199	KiB	libpng16-16
 196	KiB	libncursesw5
 191	KiB	kernel-module-nf-conntrack-5.10.41-g3314837930
+191	KiB	kernel-module-ip-vs-5.10.41-g3314837930
 190	KiB	iptables
 186	KiB	libudev1
 184	KiB	kernel-module-overlay-5.10.41-g3314837930
@@ -119,7 +124,7 @@
 146	KiB	kernel-module-musb-hdrc-5.10.41-g3314837930
 145	KiB	kernel-module-usb-storage-5.10.41-g3314837930
 144	KiB	alsa-topology-conf
-142	KiB	kernel-5.10.41-g3314837930
+143	KiB	kernel-5.10.41-g3314837930
 142	KiB	alsa-utils-aplay
 141	KiB	kernel-module-dwc3-5.10.41-g3314837930
 140	KiB	avahi-daemon
@@ -135,6 +140,7 @@
 125	KiB	alsa-utils-alsactl
 125	KiB	alsa-ucm-conf
 124	KiB	util-linux-sfdisk
+123	KiB	util-linux-lsblk
 123	KiB	kernel-module-hci-uart-5.10.41-g3314837930
 121	KiB	e2fsprogs-mke2fs
 120	KiB	kernel-module-nvme-core-5.10.41-g3314837930
@@ -144,23 +150,32 @@
 115	KiB	kernel-module-r8152-5.10.41-g3314837930
 115	KiB	i2c-tools
 113	KiB	kernel-module-soundwire-bus-5.10.41-g3314837930
+113	KiB	kernel-module-dm-thin-pool-5.10.41-g3314837930
+111	KiB	util-linux-blkid
 111	KiB	kernel-module-snd-soc-tlv320aic3x-5.10.41-g3314837930
+109	KiB	kernel-module-dm-persistent-data-5.10.41-g3314837930
 108	KiB	kernel-module-mali-dp-5.10.41-g3314837930
 107	KiB	pam-plugin-unix
 106	KiB	libnss-myhostname2
+103	KiB	util-linux-zramctl
+103	KiB	util-linux-partx
 103	KiB	libusb-1.0-0
 102	KiB	kernel-module-ipmi-si-5.10.41-g3314837930
 101	KiB	kernel-module-dsa-core-5.10.41-g3314837930
 100	KiB	e2fsprogs-tune2fs
+99	KiB	util-linux-losetup
 98	KiB	libelf1
 98	KiB	kernel-module-usb-f-uvc-5.10.41-g3314837930
 98	KiB	kernel-module-ipmi-msghandler-5.10.41-g3314837930
 96	KiB	pciutils
 96	KiB	kernel-module-cxd2880-5.10.41-g3314837930
+95	KiB	util-linux-mkswap
 94	KiB	kernel-module-stv0900-5.10.41-g3314837930
 94	KiB	kernel-module-hisi-sas-main-5.10.41-g3314837930
+92	KiB	kernel-module-vxlan-5.10.41-g3314837930
 91	KiB	kernel-module-tcrypt-5.10.41-g3314837930
 89	KiB	libgpiod
+88	KiB	util-linux-cfdisk
 88	KiB	kernel-module-stv090x-5.10.41-g3314837930
 88	KiB	kernel-module-cryptodev-5.10.41-g3314837930
 87	KiB	kernel-module-btusb-5.10.41-g3314837930
@@ -168,6 +183,8 @@
 86	KiB	kernel-module-icssg-prueth-5.10.41-g3314837930
 85	KiB	kernel-module-libcomposite-5.10.41-g3314837930
 84	KiB	libnss-mdns
+83	KiB	util-linux-lsipc
+83	KiB	util-linux-lscpu
 83	KiB	libpam
 82	KiB	kernel-module-ssb-5.10.41-g3314837930
 82	KiB	kernel-module-drxk-5.10.41-g3314837930
@@ -197,6 +214,9 @@
 69	KiB	kernel-module-ath10k-pci-5.10.41-g3314837930
 69	KiB	avahi-utils
 68	KiB	cifs-utils
+67	KiB	util-linux-hwclock
+67	KiB	util-linux-eject
+67	KiB	util-linux-dmesg
 67	KiB	libformw5
 67	KiB	libdrm2
 67	KiB	libavahi-client3
@@ -209,6 +229,11 @@
 64	KiB	kernel-module-x-tables-5.10.41-g3314837930
 64	KiB	kernel-module-mwifiex-pcie-5.10.41-g3314837930
 64	KiB	kernel-module-ahci-5.10.41-g3314837930
+63	KiB	util-linux-su
+63	KiB	util-linux-runuser
+63	KiB	util-linux-ipcs
+63	KiB	util-linux-fstrim
+63	KiB	util-linux-blkzone
 63	KiB	kernel-module-ti-cal-5.10.41-g3314837930
 63	KiB	kernel-module-dw-hdmi-5.10.41-g3314837930
 63	KiB	kernel-module-cls-flower-5.10.41-g3314837930
@@ -218,6 +243,7 @@
 60	KiB	kernel-module-usbserial-5.10.41-g3314837930
 60	KiB	kernel-module-stv0367-5.10.41-g3314837930
 60	KiB	alsa-utils-alsamixer
+59	KiB	util-linux-script
 59	KiB	kernel-module-wire-5.10.41-g3314837930
 59	KiB	kernel-module-scsi-transport-sas-5.10.41-g3314837930
 59	KiB	kernel-module-isp1760-5.10.41-g3314837930
@@ -226,20 +252,31 @@
 58	KiB	kernel-module-af-key-5.10.41-g3314837930
 57	KiB	kernel-module-stb0899-5.10.41-g3314837930
 57	KiB	kernel-module-asix-5.10.41-g3314837930
+56	KiB	util-linux-findmnt
 56	KiB	kernel-module-hsr-5.10.41-g3314837930
+55	KiB	util-linux-wdctl
+55	KiB	util-linux-resizepart
+55	KiB	util-linux-lsmem
+55	KiB	util-linux-lslogins
+55	KiB	util-linux-chmem
+55	KiB	util-linux-cal
+55	KiB	util-linux-blockdev
 55	KiB	util-linux-agetty
 55	KiB	kernel-module-usbtest-5.10.41-g3314837930
 55	KiB	kernel-module-cdc-acm-5.10.41-g3314837930
 54	KiB	kernel-module-ip6-tunnel-5.10.41-g3314837930
+54	KiB	kernel-module-dm-bufio-5.10.41-g3314837930
 53	KiB	kernel-module-snd-rawmidi-5.10.41-g3314837930
 53	KiB	kernel-module-dib9000-5.10.41-g3314837930
 52	KiB	kernel-module-usbhid-5.10.41-g3314837930
 52	KiB	kernel-module-nf-nat-5.10.41-g3314837930
 52	KiB	kernel-module-ebtables-5.10.41-g3314837930
+51	KiB	util-linux-choom
 51	KiB	libpci3
 51	KiB	libavahi-common3
 51	KiB	kernel-module-xfrm-user-5.10.41-g3314837930
 50	KiB	kernel-module-ntb-transport-5.10.41-g3314837930
+50	KiB	kernel-module-ipvlan-5.10.41-g3314837930
 50	KiB	kernel-module-hidp-5.10.41-g3314837930
 50	KiB	kernel-module-cxd2841er-5.10.41-g3314837930
 49	KiB	kernel-module-sa2ul-5.10.41-g3314837930
@@ -247,6 +284,8 @@
 48	KiB	kernel-module-smsc75xx-5.10.41-g3314837930
 48	KiB	kernel-module-dib0090-5.10.41-g3314837930
 48	KiB	kernel-module-blocklayoutdriver-5.10.41-g3314837930
+47	KiB	util-linux-scriptlive
+47	KiB	util-linux-hexdump
 47	KiB	kernel-module-hisi-sas-v2-hw-5.10.41-g3314837930
 47	KiB	kernel-module-dib7000p-5.10.41-g3314837930
 47	KiB	kernel-module-cdns-mhdp8546-5.10.41-g3314837930
@@ -259,9 +298,13 @@
 44	KiB	kernel-module-tap-5.10.41-g3314837930
 44	KiB	kernel-module-smsc95xx-5.10.41-g3314837930
 44	KiB	kernel-module-cp210x-5.10.41-g3314837930
+43	KiB	util-linux-swapon
 43	KiB	util-linux-sulogin
+43	KiB	util-linux-setpriv
 43	KiB	util-linux-mount
+43	KiB	util-linux-lsns
 43	KiB	util-linux-fsck
+43	KiB	util-linux-column
 43	KiB	kernel-module-gadgetfs-5.10.41-g3314837930
 42	KiB	psplash-default
 42	KiB	kernel-module-tuner-xc2028-5.10.41-g3314837930
@@ -282,6 +325,12 @@
 40	KiB	kernel-module-usb-f-rndis-5.10.41-g3314837930
 40	KiB	kernel-module-mxl5005s-5.10.41-g3314837930
 40	KiB	kernel-module-can-dev-5.10.41-g3314837930
+39	KiB	util-linux-rtcwake
+39	KiB	util-linux-rfkill
+39	KiB	util-linux-logger
+39	KiB	util-linux-last
+39	KiB	util-linux-chcpu
+38	KiB	util-linux-setterm
 38	KiB	kernel-module-xc5000-5.10.41-g3314837930
 38	KiB	kernel-module-rtl2832-sdr-5.10.41-g3314837930
 38	KiB	kernel-module-qcom-spmi-adc5-5.10.41-g3314837930
@@ -300,12 +349,22 @@
 36	KiB	libe2p2
 36	KiB	kernel-module-sch-htb-5.10.41-g3314837930
 36	KiB	kernel-module-ip-tunnel-5.10.41-g3314837930
+35	KiB	util-linux-wipefs
+35	KiB	util-linux-uuidd
+35	KiB	util-linux-unshare
+35	KiB	util-linux-more
+35	KiB	util-linux-lslocks
+35	KiB	util-linux-kill
+35	KiB	util-linux-ctrlaltdel
 35	KiB	kernel-module-veth-5.10.41-g3314837930
 35	KiB	kernel-module-ti-k3-r5-remoteproc-5.10.41-g3314837930
 35	KiB	kernel-module-snd-soc-j721e-evm-5.10.41-g3314837930
 35	KiB	kernel-module-btintel-5.10.41-g3314837930
 35	KiB	kernel-module-ax88179-178a-5.10.41-g3314837930
 35	KiB	kernel-module-af9033-5.10.41-g3314837930
+34	KiB	util-linux-scriptreplay
+34	KiB	util-linux-mkfs.cramfs
+34	KiB	util-linux-fsck.cramfs
 34	KiB	libacl1
 34	KiB	kernel-module-ti-sn65dsi86-5.10.41-g3314837930
 34	KiB	kernel-module-slimbus-5.10.41-g3314837930
@@ -324,16 +383,21 @@
 32	KiB	kernel-module-sch-hfsc-5.10.41-g3314837930
 32	KiB	kernel-module-sch-cbq-5.10.41-g3314837930
 32	KiB	kernel-module-at24-5.10.41-g3314837930
+31	KiB	util-linux-uuidparse
 31	KiB	util-linux-umount
+31	KiB	util-linux-prlimit
 31	KiB	kernel-module-m-can-5.10.41-g3314837930
 31	KiB	kernel-module-i2c-hid-5.10.41-g3314837930
 31	KiB	kernel-module-cx24116-5.10.41-g3314837930
 31	KiB	iptables-module-xt-hashlimit
+30	KiB	util-linux-taskset
+30	KiB	util-linux-chrt
 30	KiB	libogg0
 30	KiB	libmenuw5
 30	KiB	libffi7
 30	KiB	kernel-module-usb-f-hid-5.10.41-g3314837930
 30	KiB	kernel-module-u-ether-5.10.41-g3314837930
+30	KiB	kernel-module-udp-tunnel-5.10.41-g3314837930
 30	KiB	kernel-module-tda1004x-5.10.41-g3314837930
 30	KiB	kernel-module-sch-qfq-5.10.41-g3314837930
 30	KiB	kernel-module-sata-sil24-5.10.41-g3314837930
@@ -343,6 +407,7 @@
 30	KiB	kernel-module-ecc-5.10.41-g3314837930
 30	KiB	kernel-module-drxd-5.10.41-g3314837930
 30	KiB	kernel-module-aes-neon-blk-5.10.41-g3314837930
+30	KiB	bridge-utils
 29	KiB	kernel-module-usb-f-midi-5.10.41-g3314837930
 29	KiB	kernel-module-tuner-types-5.10.41-g3314837930
 29	KiB	kernel-module-stv0910-5.10.41-g3314837930
@@ -359,6 +424,8 @@
 28	KiB	kernel-module-ipmi-devintf-5.10.41-g3314837930
 28	KiB	kernel-module-icss-iep-5.10.41-g3314837930
 28	KiB	iptables-module-xt-conntrack
+27	KiB	util-linux-wall
+27	KiB	util-linux-nsenter
 27	KiB	kernel-module-usb-f-uac2-5.10.41-g3314837930
 27	KiB	kernel-module-pl2303-5.10.41-g3314837930
 27	KiB	kernel-module-pci-endpoint-test-5.10.41-g3314837930
@@ -368,6 +435,15 @@
 27	KiB	kernel-module-can-raw-5.10.41-g3314837930
 27	KiB	e2fsprogs-dumpe2fs
 27	KiB	alsa-server
+26	KiB	util-linux-namei
+26	KiB	util-linux-mcookie
+26	KiB	util-linux-ldattach
+26	KiB	util-linux-ipcrm
+26	KiB	util-linux-flock
+26	KiB	util-linux-fincore
+26	KiB	util-linux-fdformat
+26	KiB	util-linux-fallocate
+26	KiB	util-linux-col
 26	KiB	libuuid1
 26	KiB	libss2
 26	KiB	libdaemon0
@@ -385,6 +461,7 @@
 25	KiB	kernel-module-pruss-5.10.41-g3314837930
 25	KiB	kernel-module-ov5645-5.10.41-g3314837930
 25	KiB	kernel-module-esp4-5.10.41-g3314837930
+25	KiB	kernel-module-dm-bio-prison-5.10.41-g3314837930
 25	KiB	kernel-module-cxd2880-spi-5.10.41-g3314837930
 25	KiB	kernel-module-c-can-5.10.41-g3314837930
 25	KiB	kernel-module-aes-neon-bs-5.10.41-g3314837930
@@ -399,6 +476,7 @@
 24	KiB	kernel-module-dvb-pll-5.10.41-g3314837930
 24	KiB	kernel-module-dm-region-hash-5.10.41-g3314837930
 24	KiB	iptables-module-xt-rateest
+23	KiB	util-linux-whereis
 23	KiB	opkg
 23	KiB	libpam-runtime
 23	KiB	kernel-module-usb-wwan-5.10.41-g3314837930
@@ -418,6 +496,12 @@
 23	KiB	kernel-module-g-multi-5.10.41-g3314837930
 23	KiB	kernel-module-ds3000-5.10.41-g3314837930
 23	KiB	kernel-module-dib3000mc-5.10.41-g3314837930
+22	KiB	util-linux-utmpdump
+22	KiB	util-linux-isosize
+22	KiB	util-linux-ipcmk
+22	KiB	util-linux-ionice
+22	KiB	util-linux-colrm
+22	KiB	util-linux-blkdiscard
 22	KiB	kernel-module-usb-f-uac1-5.10.41-g3314837930
 22	KiB	kernel-module-snd-hwdep-5.10.41-g3314837930
 22	KiB	kernel-module-rpmsg-char-5.10.41-g3314837930
@@ -490,6 +574,11 @@
 19	KiB	kernel-module-brcmutil-5.10.41-g3314837930
 19	KiB	kernel-module-au8522-dig-5.10.41-g3314837930
 19	KiB	kernel-module-act-csum-5.10.41-g3314837930
+18	KiB	util-linux-ul
+18	KiB	util-linux-swapoff
+18	KiB	util-linux-hardlink
+18	KiB	util-linux-delpart
+18	KiB	util-linux-addpart
 18	KiB	systemd-vconsole-setup
 18	KiB	pam-plugin-limits
 18	KiB	netbase
@@ -542,6 +631,7 @@
 17	KiB	kernel-module-or51211-5.10.41-g3314837930
 17	KiB	kernel-module-nxt6000-5.10.41-g3314837930
 17	KiB	kernel-module-ntb-netdev-5.10.41-g3314837930
+17	KiB	kernel-module-nf-conntrack-ftp-5.10.41-g3314837930
 17	KiB	kernel-module-mtd-nandbiterrs-5.10.41-g3314837930
 17	KiB	kernel-module-mt312-5.10.41-g3314837930
 17	KiB	kernel-module-mn88443x-5.10.41-g3314837930
@@ -612,6 +702,19 @@
 15	KiB	iptables-module-xt-iprange
 15	KiB	iptables-module-xt-ct
 15	KiB	alsa-utils-alsaucm
+14	KiB	util-linux-write
+14	KiB	util-linux-uuidgen
+14	KiB	util-linux-switch-root
+14	KiB	util-linux-swaplabel
+14	KiB	util-linux-setarch
+14	KiB	util-linux-rename
+14	KiB	util-linux-readprofile
+14	KiB	util-linux-raw
+14	KiB	util-linux-mountpoint
+14	KiB	util-linux-mesg
+14	KiB	util-linux-look
+14	KiB	util-linux-getopt
+14	KiB	util-linux-colcrt
 14	KiB	pam-plugin-lastlog
 14	KiB	pam-plugin-group
 14	KiB	pam-plugin-env
@@ -686,6 +789,7 @@
 13	KiB	kernel-module-extcon-usb-gpio-5.10.41-g3314837930
 13	KiB	kernel-module-extcon-ptn5150-5.10.41-g3314837930
 13	KiB	kernel-module-dwc3-of-simple-5.10.41-g3314837930
+13	KiB	kernel-module-dummy-5.10.41-g3314837930
 13	KiB	kernel-module-authenc-5.10.41-g3314837930
 13	KiB	kernel-module-at25-5.10.41-g3314837930
 13	KiB	kernel-module-ahci-platform-5.10.41-g3314837930
@@ -703,6 +807,7 @@
 12	KiB	kernel-module-rtc-rx8581-5.10.41-g3314837930
 12	KiB	kernel-module-ohci-pci-5.10.41-g3314837930
 12	KiB	kernel-module-nf-log-common-5.10.41-g3314837930
+12	KiB	kernel-module-nf-conntrack-tftp-5.10.41-g3314837930
 12	KiB	kernel-module-mt2266-5.10.41-g3314837930
 12	KiB	kernel-module-mpl3115-5.10.41-g3314837930
 12	KiB	kernel-module-m-can-platform-5.10.41-g3314837930
@@ -715,6 +820,7 @@
 12	KiB	kernel-module-cx22702-5.10.41-g3314837930
 12	KiB	kernel-module-cx22700-5.10.41-g3314837930
 12	KiB	kernel-module-cpufreq-conservative-5.10.41-g3314837930
+12	KiB	kernel-module-cls-cgroup-5.10.41-g3314837930
 11	KiB	kernel-module-zaurus-5.10.41-g3314837930
 11	KiB	kernel-module-xt-nat-5.10.41-g3314837930
 11	KiB	kernel-module-tunnel6-5.10.41-g3314837930
@@ -741,7 +847,14 @@
 11	KiB	iptables-module-xt-socket
 11	KiB	iptables-module-xt-nfqueue
 11	KiB	iptables-module-xt-connlimit
+10	KiB	util-linux-setsid
+10	KiB	util-linux-rev
+10	KiB	util-linux-renice
+10	KiB	util-linux-pivot-root
+10	KiB	util-linux-nologin
 10	KiB	util-linux-mkfs
+10	KiB	util-linux-fsfreeze
+10	KiB	util-linux-findfs
 10	KiB	pam-plugin-securetty
 10	KiB	pam-plugin-nologin
 10	KiB	pam-plugin-motd
@@ -834,6 +947,7 @@
 9	KiB	kernel-module-sm4-generic-5.10.41-g3314837930
 9	KiB	kernel-module-qm1d1b0004-5.10.41-g3314837930
 9	KiB	kernel-module-nf-reject-ipv4-5.10.41-g3314837930
+9	KiB	kernel-module-nf-nat-ftp-5.10.41-g3314837930
 9	KiB	kernel-module-kfifo-buf-5.10.41-g3314837930
 9	KiB	kernel-module-isl6423-5.10.41-g3314837930
 9	KiB	kernel-module-gpio-wcd934x-5.10.41-g3314837930
@@ -849,6 +963,7 @@
 8	KiB	udev-extraconf
 8	KiB	kernel-module-xt-tcpudp-5.10.41-g3314837930
 8	KiB	kernel-module-xt-policy-5.10.41-g3314837930
+8	KiB	kernel-module-xt-ipvs-5.10.41-g3314837930
 8	KiB	kernel-module-xfrm4-tunnel-5.10.41-g3314837930
 8	KiB	kernel-module-videobuf2-memops-5.10.41-g3314837930
 8	KiB	kernel-module-tua6100-5.10.41-g3314837930
@@ -883,6 +998,7 @@
 7	KiB	kernel-module-qrtr-smd-5.10.41-g3314837930
 7	KiB	kernel-module-plusb-5.10.41-g3314837930
 7	KiB	kernel-module-p8022-5.10.41-g3314837930
+7	KiB	kernel-module-nf-nat-tftp-5.10.41-g3314837930
 7	KiB	kernel-module-nf-defrag-ipv4-5.10.41-g3314837930
 7	KiB	kernel-module-lnbp21-5.10.41-g3314837930
 7	KiB	kernel-module-lnbh29-5.10.41-g3314837930
@@ -890,6 +1006,7 @@
 7	KiB	kernel-module-libcrc32c-5.10.41-g3314837930
 7	KiB	kernel-module-isl6421-5.10.41-g3314837930
 7	KiB	kernel-module-ipt-reject-5.10.41-g3314837930
+7	KiB	kernel-module-ip6-udp-tunnel-5.10.41-g3314837930
 7	KiB	kernel-module-ip6t-reject-5.10.41-g3314837930
 7	KiB	kernel-module-industrialio-triggered-buffer-5.10.41-g3314837930
 7	KiB	kernel-module-ghash-generic-5.10.41-g3314837930
@@ -919,6 +1036,7 @@
 6	KiB	kernel-module-regmap-slimbus-5.10.41-g3314837930
 6	KiB	kernel-module-regmap-sdw-5.10.41-g3314837930
 6	KiB	kernel-module-isl6405-5.10.41-g3314837930
+6	KiB	kernel-module-ip-vs-rr-5.10.41-g3314837930
 6	KiB	kernel-module-ecb-5.10.41-g3314837930
 6	KiB	kernel-module-ebt-vlan-5.10.41-g3314837930
 6	KiB	kernel-module-ebt-snat-5.10.41-g3314837930
@@ -981,6 +1099,7 @@
 1	KiB	modutils-initscripts
 1	KiB	initscript-telnetd
 1	KiB	alsa-state
+0	KiB	util-linux
 0	KiB	thermal-init
 0	KiB	systemd-initramfs
 0	KiB	systemd-conf

