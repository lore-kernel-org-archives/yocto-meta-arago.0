Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id D4094529A1
	for <meta-arago@arago-project.org>;
	Wed, 10 Oct 2012 18:21:37 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9AILbkF006584;
	Wed, 10 Oct 2012 13:21:37 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9AILbt3002186;
	Wed, 10 Oct 2012 13:21:37 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Wed, 10 Oct 2012 13:21:36 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Franklin S. Cooper Jr"
	<fcooperjr27@gmail.com>
Thread-Topic: [meta-arago] [meta-arago-extras][PATCH] ti-tisdk-setup: Port
	ti-tisdk-setup from arago
Thread-Index: AQHNmFkY5UdyyyUSCkSeh1clB6luSZeaYi6AgBiUgLA=
Date: Wed, 10 Oct 2012 18:21:35 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C300E9C@DFLE09.ent.ti.com>
References: <1348275070-27814-1-git-send-email-fcooper@ti.com>
	<20120924215703.GG4278@denix.org>
In-Reply-To: <20120924215703.GG4278@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 10 Oct 2012 18:53:55 +0000
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [meta-arago-extras][PATCH] ti-tisdk-setup: Port ti-tisdk-setup from arago
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
X-List-Received-Date: Wed, 10 Oct 2012 18:21:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

What's concerning you about this patch?

-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Dmytriyenko, Denys
Sent: Monday, September 24, 2012 4:57 PM
To: Franklin S. Cooper Jr
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [meta-arago-extras][PATCH] ti-tisdk-setup: Port t=
i-tisdk-setup from arago

On Fri, Sep 21, 2012 at 07:51:10PM -0500, Franklin S. Cooper Jr wrote:
> * Port ti-tisdk-setup from arago to meta-arago.
> * This recipe brings in various scripts used to setup the SDK on
>   a user's development machine.

Let me sit on this one for a little bit longer...


> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb |   44 +
>  .../ti-tisdk-setup/ti-tisdk-setup/common.sh        |   39 +
>  .../ti-tisdk-setup/ti-tisdk-setup/create-sdcard.sh |  958 ++++++++++++++=
++++++
>  .../ti-tisdk-setup/setup-host-check.sh             |   43 +
>  .../ti-tisdk-setup/ti-tisdk-setup/setup-minicom.sh |  101 ++
>  .../ti-tisdk-setup/setup-package-install.sh        |   50 +
>  .../ti-tisdk-setup/setup-targetfs-nfs.sh           |  153 ++++
>  .../ti-tisdk-setup/ti-tisdk-setup/setup-tftp.sh    |  150 +++
>  .../ti-tisdk-setup/setup-uboot-env-am18x.sh        |  308 +++++++
>  .../ti-tisdk-setup/setup-uboot-env-am335x.sh       |  409 +++++++++
>  .../ti-tisdk-setup/setup-uboot-env-am3517.sh       |  266 ++++++
>  .../ti-tisdk-setup/setup-uboot-env-am37x.sh        |  268 ++++++
>  .../ti-tisdk-setup/setup-uboot-env-beagleboard.sh  |  268 ++++++
>  .../ti-tisdk-setup/ti-tisdk-setup/setup.sh         |   65 ++
>  14 files changed, 3122 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tis=
dk-setup.bb
>  create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tis=
dk-setup/common.sh
>  create mode 100755 meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tis=
dk-setup/create-sdcard.sh
>  create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tis=
dk-setup/setup-host-check.sh
>  create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tis=
dk-setup/setup-minicom.sh
>  create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tis=
dk-setup/setup-package-install.sh
>  create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tis=
dk-setup/setup-targetfs-nfs.sh
>  create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tis=
dk-setup/setup-tftp.sh
>  create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tis=
dk-setup/setup-uboot-env-am18x.sh
>  create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tis=
dk-setup/setup-uboot-env-am335x.sh
>  create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tis=
dk-setup/setup-uboot-env-am3517.sh
>  create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tis=
dk-setup/setup-uboot-env-am37x.sh
>  create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tis=
dk-setup/setup-uboot-env-beagleboard.sh
>  create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tis=
dk-setup/setup.sh
>=20
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setu=
p.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
> new file mode 100644
> index 0000000..b9021eb
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
> @@ -0,0 +1,44 @@
> +DESCRIPTION =3D "Package containing scripts to setup the development hos=
t and target board"
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://setup.sh;beginline=3D3;endline=3D31;md5=3Df=
c4b04a33df6d892c9f4d4a9d92b945e"
> +
> +COMPATIBLE_MACHINE =3D "am37x-evm|am3517-evm|beagleboard|ti33x|am180x-ev=
m"
> +
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +
> +UBOOT_ENV_am37x-evm =3D "setup-uboot-env-am37x.sh"
> +UBOOT_ENV_beagleboard =3D "setup-uboot-env-beagleboard.sh"
> +UBOOT_ENV_am3517-evm =3D "setup-uboot-env-am3517.sh"
> +UBOOT_ENV_am180x-evm =3D "setup-uboot-env-am18x.sh"
> +UBOOT_ENV_ti33x =3D "setup-uboot-env-am335x.sh"
> +
> +SRC_URI =3D "\
> +	file://setup.sh \
> +	file://common.sh \
> +	file://setup-host-check.sh \
> +	file://setup-minicom.sh \
> +	file://setup-package-install.sh \
> +	file://setup-targetfs-nfs.sh \
> +	file://setup-tftp.sh \
> +    file://create-sdcard.sh \
> +    file://${UBOOT_ENV} \
> +"
> +
> +PR =3D "r0"
> +
> +S =3D "${WORKDIR}"
> +
> +do_install () {
> +    install -m 0755 ${WORKDIR}/setup.sh ${D}/
> +	install -d ${D}/bin
> +    install -m 0755 ${WORKDIR}/common.sh ${D}/bin
> +    install -m 0755 ${WORKDIR}/setup-host-check.sh ${D}/bin
> +    install -m 0755 ${WORKDIR}/setup-minicom.sh ${D}/bin
> +    install -m 0755 ${WORKDIR}/setup-package-install.sh ${D}/bin
> +    install -m 0755 ${WORKDIR}/setup-targetfs-nfs.sh ${D}/bin
> +    install -m 0755 ${WORKDIR}/setup-tftp.sh ${D}/bin
> +    install -m 0755 ${WORKDIR}/create-sdcard.sh ${D}/bin
> +    install -m 0755 ${WORKDIR}/${UBOOT_ENV} ${D}/bin/setup-uboot-env.sh
> +}
> +
> +FILES_${PN} +=3D "setup.sh"
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setu=
p/common.sh b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup=
/common.sh
> new file mode 100644
> index 0000000..57e0836
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup/commo=
n.sh
> @@ -0,0 +1,39 @@
> +#!/bin/sh
> +
> +# This distribution contains contributions or derivatives under copyrigh=
t
> +# as follows:
> +#
> +# Copyright (c) 2010, Texas Instruments Incorporated
> +# All rights reserved.
> +#
> +# Redistribution and use in source and binary forms, with or without
> +# modification, are permitted provided that the following conditions
> +# are met:
> +# - Redistributions of source code must retain the above copyright notic=
e,
> +#   this list of conditions and the following disclaimer.
> +# - Redistributions in binary form must reproduce the above copyright
> +#   notice, this list of conditions and the following disclaimer in the
> +#   documentation and/or other materials provided with the distribution.
> +# - Neither the name of Texas Instruments nor the names of its
> +#   contributors may be used to endorse or promote products derived
> +#   from this software without specific prior written permission.
> +#
> +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
> +# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMI=
TED
> +# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTIC=
ULAR
> +# PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
> +# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
> +# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
> +# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
> +# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
> +# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING N=
EGLIGENCE
> +# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN=
 IF
> +# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> +
> +check_status() {
> +    ret=3D$?
> +    if [ "$ret" -ne "0" ]; then
> +        echo "Failed setup, aborting.."
> +        exit 1
> +    fi
> +}
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setu=
p/create-sdcard.sh b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisd=
k-setup/create-sdcard.sh
> new file mode 100755
> index 0000000..c586687
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup/creat=
e-sdcard.sh
> @@ -0,0 +1,958 @@
> +#!/bin/bash
> +# Authors:
> +#    LT Thomas <ltjr@ti.com>
> +#    Chase Maupin
> +# create-sdcard.sh v0.3
> +
> +# This distribution contains contributions or derivatives under copyrigh=
t
> +# as follows:
> +#
> +# Copyright (c) 2010, Texas Instruments Incorporated
> +# All rights reserved.
> +#
> +# Redistribution and use in source and binary forms, with or without
> +# modification, are permitted provided that the following conditions
> +# are met:
> +# - Redistributions of source code must retain the above copyright notic=
e,
> +#   this list of conditions and the following disclaimer.
> +# - Redistributions in binary form must reproduce the above copyright
> +#   notice, this list of conditions and the following disclaimer in the
> +#   documentation and/or other materials provided with the distribution.
> +# - Neither the name of Texas Instruments nor the names of its
> +#   contributors may be used to endorse or promote products derived
> +#   from this software without specific prior written permission.
> +#
> +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
> +# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMI=
TED
> +# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTIC=
ULAR
> +# PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
> +# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
> +# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
> +# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
> +# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
> +# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING N=
EGLIGENCE
> +# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN=
 IF
> +# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> +
> +# Determine the absolute path to the executable
> +# EXE will have the PWD removed so we can concatenate with the PWD safel=
y
> +PWD=3D`pwd`
> +EXE=3D`echo $0 | sed s=3D$PWD=3D=3D`
> +EXEPATH=3D"$PWD"/"$EXE"
> +clear
> +cat << EOM
> +
> +########################################################################=
########
> +
> +This script will create a bootable SD card from custom or pre-built bina=
ries.
> +
> +The script must be run with root permissions and from the bin directory =
of
> +the SDK
> +
> +Example:
> + $ sudo ./create-sdcard.sh
> +
> +Formatting can be skipped if the SD card is already formatted and
> +partitioned properly.
> +
> +########################################################################=
########
> +
> +EOM
> +
> +AMIROOT=3D`whoami | awk {'print $1'}`
> +if [ "$AMIROOT" !=3D "root" ] ; then
> +
> +	echo "	**** Error *** must run script with sudo"
> +	echo ""
> +	exit
> +fi
> +
> +THEPWD=3D$EXEPATH
> +PARSEPATH=3D`echo $THEPWD | grep -o '.*ti-sdk.*.[0-9]/'`
> +
> +if [ "$PARSEPATH" !=3D "" ] ; then
> +PATHVALID=3D1
> +else
> +PATHVALID=3D0
> +fi
> +
> +#Precentage function
> +untar_progress ()
> +{
> +    TARBALL=3D$1;
> +    DIRECTPATH=3D$2;
> +    BLOCKING_FACTOR=3D$(($(gzip --list ${TARBALL} | sed -n -e "s/.*[[:sp=
ace:]]\+[0-9]\+[[:space:]]\+\([0-9]\+\)[[:space:]].*$/\1/p") / 51200 + 1));
> +    tar --blocking-factor=3D${BLOCKING_FACTOR} --checkpoint=3D1 --checkp=
oint-action=3D'ttyout=3DWritten %u%  \r' -zxf ${TARBALL} -C ${DIRECTPATH}
> +}
> +
> +#copy/paste programs
> +cp_progress ()
> +{
> +	CURRENTSIZE=3D0
> +	while [ $CURRENTSIZE -lt $TOTALSIZE ]
> +	do
> +		TOTALSIZE=3D$1;
> +		TOHERE=3D$2;
> +		CURRENTSIZE=3D`sudo du -c $TOHERE | grep total | awk {'print $1'}`
> +		echo -e -n "$CURRENTSIZE /  $TOTALSIZE copied \r"
> +		sleep 1
> +	done
> +}
> +
> +populate_3_partitions() {
> +    ENTERCORRECTLY=3D"0"
> +	while [ $ENTERCORRECTLY -ne 1 ]
> +	do
> +		read -e -p 'Enter path where SD card tarballs were downloaded : '  TAR=
BALLPATH
> +
> +		echo ""
> +		ENTERCORRECTLY=3D1
> +		if [ -d $TARBALLPATH ]
> +		then
> +			echo "Directory exists"
> +			echo ""
> +			echo "This directory contains:"
> +			ls $TARBALLPATH
> +			echo ""
> +			read -p 'Is this correct? [y/n] : ' ISRIGHTPATH
> +				case $ISRIGHTPATH in
> +				"y" | "Y") ;;
> +				"n" | "N" ) ENTERCORRECTLY=3D0;continue;;
> +				*)  echo "Please enter y or n";ENTERCORRECTLY=3D0;continue;;
> +				esac
> +		else
> +			echo "Invalid path make sure to include complete path"
> +			ENTERCORRECTLY=3D0
> +            continue
> +		fi
> +        # Check that tarballs were found
> +        if [ ! -e "$TARBALLPATH""/boot_partition.tar.gz" ]
> +        then
> +            echo "Could not find boot_partition.tar.gz as expected.  Ple=
ase"
> +            echo "point to the directory containing the boot_partition.t=
ar.gz"
> +            ENTERCORRECTLY=3D0
> +            continue
> +        fi
> +
> +        if [ ! -e "$TARBALLPATH""/rootfs_partition.tar.gz" ]
> +        then
> +            echo "Could not find rootfs_partition.tar.gz as expected.  P=
lease"
> +            echo "point to the directory containing the rootfs_partition=
.tar.gz"
> +            ENTERCORRECTLY=3D0
> +            continue
> +        fi
> +
> +        if [ ! -e "$TARBALLPATH""/start_here_partition.tar.gz" ]
> +        then
> +            echo "Could not find start_here_partition.tar.gz as expected=
.  Please"
> +            echo "point to the directory containing the start_here_parti=
tion.tar.gz"
> +            ENTERCORRECTLY=3D0
> +            continue
> +        fi
> +	done
> +
> +        # Make temporary directories and untar mount the partitions
> +        mkdir $PWD/boot
> +        mkdir $PWD/rootfs
> +        mkdir $PWD/start_here
> +        mkdir $PWD/tmp
> +
> +        mount -t vfat "/dev/""$DEVICEDRIVENAME""1" boot
> +        mount -t ext3 "/dev/""$DEVICEDRIVENAME""2" rootfs
> +        mount -t ext3 "/dev/""$DEVICEDRIVENAME""3" start_here
> +
> +        # Remove any existing content in case the partitions were not
> +        # recreated
> +        sudo rm -rf boot/*
> +        sudo rm -rf rootfs/*
> +        sudo rm -rf start_here/*
> +
> +        # Extract the tarball contents.
> +cat << EOM
> +
> +########################################################################=
########
> +        Extracting boot partition tarball
> +
> +########################################################################=
########
> +EOM
> +        untar_progress $TARBALLPATH/boot_partition.tar.gz tmp/
> +        if [ -e "./tmp/MLO" ]
> +        then
> +            cp ./tmp/MLO boot/
> +        fi
> +        cp -rf ./tmp/* boot/
> +
> +cat << EOM
> +
> +########################################################################=
########
> +        Extracting rootfs partition tarball
> +
> +########################################################################=
########
> +EOM
> +        untar_progress $TARBALLPATH/rootfs_partition.tar.gz rootfs/
> +
> +cat << EOM
> +
> +########################################################################=
########
> +        Extracting start_here partition to temp directory
> +
> +########################################################################=
########
> +EOM
> +        rm -rf tmp/*
> +        untar_progress $TARBALLPATH/start_here_partition.tar.gz tmp/
> +
> +cat << EOM
> +
> +########################################################################=
########
> +        Extracting CCS tarball
> +
> +########################################################################=
########
> +EOM
> +        mv tmp/CCS-5*.tar.gz .
> +        untar_progress CCS-5*.tar.gz tmp/
> +        rm CCS-5*.tar.gz
> +
> +cat << EOM
> +
> +########################################################################=
########
> +        Copying Contents to START_HERE
> +
> +########################################################################=
########
> +EOM
> +
> +        TOTALSIZE=3D`sudo du -c tmp/* | grep total | awk {'print $1'}`
> +        cp -rf tmp/* start_here/ &
> +        cp_progress $TOTALSIZE start_here/
> +        sync;sync
> +        # Fix up the START_HERE partitoin permissions
> +        chown nobody -R start_here
> +        chgrp nogroup -R start_here
> +        chmod -R g+r+x,o+r+x start_here/CCS
> +
> +        umount boot rootfs start_here
> +        sync;sync
> +
> +        # Clean up the temp directories
> +        rm -rf boot rootfs start_here tmp
> +}
> +
> +
> +# find the avaible SD cards
> +echo " "
> +echo "Availible Drives to write images to: "
> +echo " "
> +ROOTDRIVE=3D`mount | grep 'on / ' | awk {'print $1'} |  cut -c6-8`
> +echo "#  major   minor    size   name "
> +cat /proc/partitions | grep -v $ROOTDRIVE | grep '\<sd.\>' | grep -n ''
> +echo " "
> +
> +ENTERCORRECTLY=3D0
> +while [ $ENTERCORRECTLY -ne 1 ]
> +do
> +	read -p 'Enter Device Number: ' DEVICEDRIVENUMBER
> +	echo " "
> +	DEVICEDRIVENAME=3D`cat /proc/partitions | grep -v 'sda' | grep '\<sd.\>=
' | grep -n '' | grep "${DEVICEDRIVENUMBER}:" | awk '{print $5}'`
> +
> +	DRIVE=3D/dev/$DEVICEDRIVENAME
> +	DEVICESIZE=3D`cat /proc/partitions | grep -v 'sda' | grep '\<sd.\>' | g=
rep -n '' | grep "${DEVICEDRIVENUMBER}:" | awk '{print $4}'`
> +
> +
> +	if [ -n "$DEVICEDRIVENAME" ]
> +	then
> +		ENTERCORRECTLY=3D1
> +	else
> +		echo "Invalid selection"
> +	fi
> +
> +	echo ""
> +done
> +
> +echo "$DEVICEDRIVENAME was selected"
> +#Check the size of disk to make sure its under 16GB
> +if [ $DEVICESIZE -gt 17000000 ] ; then
> +cat << EOM
> +
> +########################################################################=
########
> +
> +		**********WARNING**********
> +
> +	Selected Device is greater then 16GB
> +	Continuing past this point will erase data from device
> +	Double check that this is the correct SD Card
> +
> +########################################################################=
########
> +
> +EOM
> +	ENTERCORRECTLY=3D0
> +	while [ $ENTERCORRECTLY -ne 1 ]
> +	do
> +		read -p 'Would you like to continue [y/n] : ' SIZECHECK
> +		echo ""
> +		echo " "
> +		ENTERCORRECTLY=3D1
> +		case $SIZECHECK in
> +		"y")  ;;
> +		"n")  exit;;
> +		*)  echo "Please enter y or n";ENTERCORRECTLY=3D0;;
> +		esac
> +		echo ""
> +	done
> +
> +fi
> +
> +echo ""
> +
> +
> +
> +DRIVE=3D/dev/$DEVICEDRIVENAME
> +
> +echo "Checking the device is unmounted"
> +#unmount drives if they are mounted
> +unmounted1=3D`df | grep '\<'$DEVICEDRIVENAME'1\>' | awk '{print $1}'`
> +unmounted2=3D`df | grep '\<'$DEVICEDRIVENAME'2\>' | awk '{print $1}'`
> +unmounted3=3D`df | grep '\<'$DEVICEDRIVENAME'3\>' | awk '{print $1}'`
> +if [ -n "$unmounted1" ]
> +then
> +	echo " unmounted ${DRIVE}1"
> +	sudo umount -f ${DRIVE}1
> +fi
> +if [ -n "$unmounted2" ]
> +then
> +	echo " unmounted ${DRIVE}2"
> +	sudo umount -f ${DRIVE}2
> +fi
> +if [ -n "$unmounted3" ]
> +then
> +	echo " unmounted ${DRIVE}3"
> +	sudo umount -f ${DRIVE}3
> +fi
> +echo ""
> +# check to see if the device is already partitioned
> +SIZE1=3D`cat /proc/partitions | grep -v 'sda' | grep '\<'$DEVICEDRIVENAM=
E'1\>'  | awk '{print $3}'`
> +SIZE2=3D`cat /proc/partitions | grep -v 'sda' | grep '\<'$DEVICEDRIVENAM=
E'2\>'  | awk '{print $3}'`
> +SIZE3=3D`cat /proc/partitions | grep -v 'sda' | grep '\<'$DEVICEDRIVENAM=
E'3\>'  | awk '{print $3}'`
> +SIZE4=3D`cat /proc/partitions | grep -v 'sda' | grep '\<'$DEVICEDRIVENAM=
E'4\>'  | awk '{print $3}'`
> +echo "${DEVICEDRIVENAME}1  ${DEVICEDRIVENAME}2   ${DEVICEDRIVENAME}3"
> +echo $SIZE1 $SIZE2 $SIZE3 $SIZE4
> +echo ""
> +
> +if [ -n "$SIZE1" -a -n "$SIZE2" ] ; then
> +	if  [ "$SIZE1" -gt "72000" -a "$SIZE2" -gt "700000" ]
> +	then
> +		PARTITION=3D1
> +
> +		if [ -z "$SIZE3" -a -z "$SIZE4" ]
> +		then
> +			#Detected 2 partitions
> +			PARTS=3D2
> +
> +		elif [ "$SIZE3" -gt "1000" -a -z "$SIZE4" ]
> +		then
> +			#Detected 3 partitions
> +			PARTS=3D3
> +
> +		else
> +			echo "SD Card is not correctly partitioned"
> +			PARTITION=3D0
> +		fi
> +	fi
> +else
> +	echo "SD Card is not correctly partitioned"
> +	PARTITION=3D0
> +	PARTS=3D0
> +fi
> +
> +
> +#Partition is found
> +if [ "$PARTITION" -eq "1" ]
> +then
> +cat << EOM
> +
> +########################################################################=
########
> +
> +   Detected device has $PARTS partitions already
> +
> +   Re-partitioning will allow the choice of 2 or 3 partitions
> +
> +########################################################################=
########
> +
> +EOM
> +
> +	ENTERCORRECTLY=3D0
> +	while [ $ENTERCORRECTLY -ne 1 ]
> +	do
> +		read -p 'Would you like to re-partition the drive anyways [y/n] : ' CA=
SEPARTITION
> +		echo ""
> +		echo " "
> +		ENTERCORRECTLY=3D1
> +		case $CASEPARTITION in
> +		"y")  echo "Now partitioning $DEVICEDRIVENAME ...";PARTITION=3D0;;
> +		"n")  echo "Skipping partitioning";;
> +		*)  echo "Please enter y or n";ENTERCORRECTLY=3D0;;
> +		esac
> +		echo ""
> +	done
> +
> +fi
> +
> +#Partition is not found, choose to partition 2 or 3 segments
> +if [ "$PARTITION" -eq "0" ]
> +then
> +cat << EOM
> +
> +########################################################################=
########
> +
> +	Select 2 partitions if only need boot and rootfs (most users)
> +	Select 3 partitions if need SDK & CCS on SD card.  This is usually used
> +        by device manufacturers with access to partition tarballs.
> +
> +	****WARNING**** continuing will erase all data on $DEVICEDRIVENAME
> +
> +########################################################################=
########
> +
> +EOM
> +	ENTERCORRECTLY=3D0
> +	while [ $ENTERCORRECTLY -ne 1 ]
> +	do
> +
> +		read -p 'Number of partitions needed [2/3] : ' CASEPARTITIONNUMBER
> +		echo ""
> +		echo " "
> +		ENTERCORRECTLY=3D1
> +		case $CASEPARTITIONNUMBER in
> +		"2")  echo "Now partitioning $DEVICEDRIVENAME with 2 partitions...";PA=
RTITION=3D2;;
> +		"3")  echo "Now partitioning $DEVICEDRIVENAME with 3 partitions...";PA=
RTITION=3D3;;
> +		"n")  exit;;
> +		*)  echo "Please enter 2 or 3";ENTERCORRECTLY=3D0;;
> +		esac
> +		echo " "
> +	done
> +fi
> +
> +
> +
> +#Section for partitioning the drive
> +
> +#create 3 partitions
> +if [ "$PARTITION" -eq "3" ]
> +then
> +
> +# set the PARTS value as well
> +PARTS=3D3
> +
> +cat << EOM
> +
> +########################################################################=
########
> +
> +		Now making 3 partitions
> +
> +########################################################################=
########
> +
> +EOM
> +
> +dd if=3D/dev/zero of=3D$DRIVE bs=3D1024 count=3D1024
> +
> +SIZE=3D`fdisk -l $DRIVE | grep Disk | awk '{print $5}'`
> +
> +echo DISK SIZE - $SIZE bytes
> +
> +CYLINDERS=3D`echo $SIZE/255/63/512 | bc`
> +
> +sfdisk -D -H 255 -S 63 -C $CYLINDERS $DRIVE << EOF
> +,9,0x0C,*
> +10,90,,-
> +100,,,-
> +EOF
> +
> +cat << EOM
> +
> +########################################################################=
########
> +
> +		Partitioning Boot
> +
> +########################################################################=
########
> +EOM
> +	mkfs.vfat -F 32 -n "boot" ${DRIVE}1
> +cat << EOM
> +
> +########################################################################=
########
> +
> +		Partitioning Rootfs
> +
> +########################################################################=
########
> +EOM
> +	mkfs.ext3 -L "rootfs" ${DRIVE}2
> +cat << EOM
> +
> +########################################################################=
########
> +
> +		Partitioning START_HERE
> +
> +########################################################################=
########
> +EOM
> +	mkfs.ext3 -L "START_HERE" ${DRIVE}3
> +	sync
> +	sync
> +
> +#create only 2 partitions
> +elif [ "$PARTITION" -eq "2" ]
> +then
> +
> +# Set the PARTS value as well
> +PARTS=3D2
> +cat << EOM
> +
> +########################################################################=
########
> +
> +		Now making 2 partitions
> +
> +########################################################################=
########
> +
> +EOM
> +dd if=3D/dev/zero of=3D$DRIVE bs=3D1024 count=3D1024
> +
> +SIZE=3D`fdisk -l $DRIVE | grep Disk | awk '{print $5}'`
> +
> +echo DISK SIZE - $SIZE bytes
> +
> +CYLINDERS=3D`echo $SIZE/255/63/512 | bc`
> +
> +sfdisk -D -H 255 -S 63 -C $CYLINDERS $DRIVE << EOF
> +,9,0x0C,*
> +10,,,-
> +EOF
> +
> +cat << EOM
> +
> +########################################################################=
########
> +
> +		Partitioning Boot
> +
> +########################################################################=
########
> +EOM
> +	mkfs.vfat -F 32 -n "boot" ${DRIVE}1
> +cat << EOM
> +
> +########################################################################=
########
> +
> +		Partitioning rootfs
> +
> +########################################################################=
########
> +EOM
> +	mkfs.ext3 -L "rootfs" ${DRIVE}2
> +	sync
> +	sync
> +	INSTALLSTARTHERE=3Dn
> +fi
> +
> +
> +
> +#Break between partitioning and installing file system
> +cat << EOM
> +
> +
> +########################################################################=
########
> +
> +   Partitioning is now done
> +   Continue to install filesystem or select 'n' to safe exit
> +
> +   **Warning** Continuing will erase files any files in the partitions
> +
> +########################################################################=
########
> +
> +
> +EOM
> +ENTERCORRECTLY=3D0
> +while [ $ENTERCORRECTLY -ne 1 ]
> +do
> +	read -p 'Would you like to continue? [y/n] : ' EXITQ
> +	echo ""
> +	echo " "
> +	ENTERCORRECTLY=3D1
> +	case $EXITQ in
> +	"y") ;;
> +	"n") exit;;
> +	*)  echo "Please enter y or n";ENTERCORRECTLY=3D0;;
> +	esac
> +done
> +
> +# If this is a three partition card then we will jump to a function to
> +# populate the three partitions and then exit the script.  If not we
> +# go on to prompt the user for input on the two partitions
> +if [ "$PARTS" -eq "3" ]
> +then
> +    populate_3_partitions
> +    exit 0
> +fi
> +
> +#Add directories for images
> +export START_DIR=3D$PWD
> +mkdir $START_DIR/tmp
> +export PATH_TO_SDBOOT=3Dboot
> +export PATH_TO_SDROOTFS=3Drootfs
> +export PATH_TO_TMP_DIR=3D$START_DIR/tmp
> +
> +
> +echo " "
> +echo "Mount the partitions "
> +mkdir $PATH_TO_SDBOOT
> +mkdir $PATH_TO_SDROOTFS
> +
> +sudo mount -t vfat ${DRIVE}1 boot/
> +sudo mount -t ext3 ${DRIVE}2 rootfs/
> +
> +
> +
> +echo " "
> +echo "Emptying partitions "
> +echo " "
> +sudo rm -rf  $PATH_TO_SDBOOT/*
> +sudo rm -rf  $PATH_TO_SDROOTFS/*
> +
> +echo ""
> +echo "Syncing...."
> +echo ""
> +sync
> +sync
> +sync
> +
> +cat << EOM
> +########################################################################=
########
> +
> +	Choose file path to install from
> +
> +	1 ) Install pre-built images from SDK
> +	2 ) Enter in custom boot and rootfs file paths
> +
> +########################################################################=
########
> +
> +EOM
> +ENTERCORRECTLY=3D0
> +while [ $ENTERCORRECTLY -ne 1 ]
> +do
> +	read -p 'Choose now [1/2] : ' FILEPATHOPTION
> +	echo ""
> +	echo " "
> +	ENTERCORRECTLY=3D1
> +	case $FILEPATHOPTION in
> +	"1") echo "Will now install from SDK pre-built images";;
> +	"2") echo "";;
> +	*)  echo "Please enter 1 or 2";ENTERCORRECTLY=3D0;;
> +	esac
> +done
> +
> +# SDK DEFAULTS
> +if [ $FILEPATHOPTION -eq 1 ] ; then
> +
> +	#check that in the right directory
> +
> +	THEEVMSDK=3D`echo $PARSEPATH | grep -o 'ti-sdk-.*[0-9]'`
> +
> +	if [ $PATHVALID -eq 1 ]; then
> +	echo "now installing:  $THEEVMSDK"
> +	else
> +	echo "no SDK PATH found"
> +	ENTERCORRECTLY=3D0
> +		while [ $ENTERCORRECTLY -ne 1 ]
> +		do
> +			read -e -p 'Enter path to SDK : '  SDKFILEPATH
> +
> +			echo ""
> +			ENTERCORRECTLY=3D1
> +			if [ -d $SDKFILEPATH ]
> +			then
> +				echo "Directory exists"
> +				echo ""
> +				PARSEPATH=3D`echo $SDKFILEPATH | grep -o '.*ti-sdk.*.[0-9]/'`
> +				#echo $PARSEPATH
> +
> +				if [ "$PARSEPATH" !=3D "" ] ; then
> +				PATHVALID=3D1
> +				else
> +				PATHVALID=3D0
> +				fi
> +				#echo $PATHVALID
> +				if [ $PATHVALID -eq 1 ] ; then
> +
> +				THEEVMSDK=3D`echo $SDKFILEPATH | grep -o 'ti-sdk-.*[0-9]'`
> +				echo "Is this the correct SDK: $THEEVMSDK"
> +				echo ""
> +				read -p 'Is this correct? [y/n] : ' ISRIGHTPATH
> +					case $ISRIGHTPATH in
> +					"y") ;;
> +					"n") ENTERCORRECTLY=3D0;;
> +					*)  echo "Please enter y or n";ENTERCORRECTLY=3D0;;
> +					esac
> +				else
> +				echo "Invalid SDK path make sure to include ti-sdk-xxxx"
> +				ENTERCORRECTLY=3D0
> +				fi
> +
> +			else
> +				echo "Invalid path make sure to include complete path"
> +
> +				ENTERCORRECTLY=3D0
> +			fi
> +		done
> +	fi
> +
> +
> +
> +	#check that files are in SDK
> +	BOOTFILEPATH=3D"$PARSEPATH/board-support/prebuilt-images"
> +	MLO=3D`ls $BOOTFILEPATH | grep MLO | awk {'print $1'}`
> +	UIMAGE=3D`ls $BOOTFILEPATH | grep uImage | awk {'print $1'}`
> +	BOOTIMG=3D`ls $BOOTFILEPATH | grep u-boot | grep .img | awk {'print $1'=
}`
> +	BOOTBIN=3D`ls $BOOTFILEPATH | grep u-boot | grep .bin | awk {'print $1'=
}`
> +	#rootfs
> +	ROOTFILEPARTH=3D"$PARSEPATH/filesystem"
> +	#ROOTFSTAR=3D`ls  $ROOTFILEPARTH | grep tisdk-rootfs | awk {'print $1'}=
`
> +
> +	#Make sure there is only 1 tar
> +	CHECKNUMOFTAR=3D`ls $ROOTFILEPARTH | grep "tisdk-rootfs" | grep 'tar.gz=
' | grep -n '' | grep '2:' | awk {'print $1'}`
> +	if [ -n "$CHECKNUMOFTAR" ]
> +	then
> +cat << EOM
> +
> +########################################################################=
########
> +
> +   Multiple rootfs Tarballs found
> +
> +########################################################################=
########
> +
> +EOM
> +		ls $ROOTFILEPARTH | grep "tisdk-rootfs" | grep 'tar.gz' | grep -n '' |=
 awk {'print "	" , $1'}
> +		echo ""
> +		read -p "Enter Number of rootfs Tarball: " TARNUMBER
> +		echo " "
> +		FOUNDTARFILENAME=3D`ls $ROOTFILEPARTH | grep "rootfs" | grep 'tar.gz' =
| grep -n '' | grep "${TARNUMBER}:" | cut -c3- | awk {'print$1'}`
> +		ROOTFSTAR=3D$FOUNDTARFILENAME
> +
> +	else
> +		ROOTFSTAR=3D`ls  $ROOTFILEPARTH | grep tisdk-rootfs | awk {'print $1'}=
`
> +	fi
> +
> +	ROOTFSUSERFILEPATH=3D$ROOTFILEPARTH/$ROOTFSTAR
> +	BOOTPATHOPTION=3D1
> +	ROOTFSPATHOPTION=3D2
> +
> +elif [ $FILEPATHOPTION -eq 2  ] ; then
> +cat << EOM
> +########################################################################=
########
> +
> +  For Boot partition
> +
> +  If files are located in Tarball write complete path including the file=
 name.
> +      e.x. $:  /home/user/MyCustomTars/boot.tar.gz
> +
> +  If files are located in a directory write the directory path
> +      e.x. $: /ti-sdk/board-support/prebuilt-images/
> +
> +  and the beginning of the files should be labeled with MLO, u-boot, uIm=
age
> +      i.e.   test_MLO_image must be labeled as MLO_test_image
> +
> +  NOTE: Not all platforms will have an MLO file and this file can
> +        be ignored for platforms that do not support an MLO
> +########################################################################=
########
> +
> +EOM
> +	ENTERCORRECTLY=3D0
> +	while [ $ENTERCORRECTLY -ne 1 ]
> +	do
> +		read -e -p 'Enter path for Boot Partition : '  BOOTUSERFILEPATH
> +
> +		echo ""
> +		ENTERCORRECTLY=3D1
> +		if [ -f $BOOTUSERFILEPATH ]
> +		then
> +			echo "File exists"
> +			echo ""
> +		elif [ -d $BOOTUSERFILEPATH ]
> +		then
> +			echo "Directory exists"
> +			echo ""
> +			echo "This directory contains:"
> +			ls $BOOTUSERFILEPATH
> +			echo ""
> +			read -p 'Is this correct? [y/n] : ' ISRIGHTPATH
> +				case $ISRIGHTPATH in
> +				"y") ;;
> +				"n") ENTERCORRECTLY=3D0;;
> +				*)  echo "Please enter y or n";ENTERCORRECTLY=3D0;;
> +				esac
> +		else
> +			echo "Invalid path make sure to include complete path"
> +
> +			ENTERCORRECTLY=3D0
> +		fi
> +	done
> +
> +cat << EOM
> +
> +
> +########################################################################=
########
> +
> +   For Rootfs partition
> +
> +   If files are located in Tarball write complete path including the fil=
e name.
> +      e.x. $:  /home/user/MyCustomTars/rootfs.tar.gz
> +
> +  If files are located in a directory write the directory path
> +      e.x. $: /ti-sdk/targetNFS/
> +
> +########################################################################=
########
> +
> +EOM
> +	ENTERCORRECTLY=3D0
> +	while [ $ENTERCORRECTLY -ne 1 ]
> +	do
> +		read -e -p 'Enter path for Rootfs Partition : ' ROOTFSUSERFILEPATH
> +		echo ""
> +		ENTERCORRECTLY=3D1
> +		if [ -f $ROOTFSUSERFILEPATH ]
> +		then
> +			echo "File exists"
> +			echo ""
> +		elif [ -d $ROOTFSUSERFILEPATH ]
> +		then
> +			echo "This directory contains:"
> +			ls $ROOTFSUSERFILEPATH
> +			echo ""
> +			read -p 'Is this correct? [y/n] : ' ISRIGHTPATH
> +				case $ISRIGHTPATH in
> +				"y") ;;
> +				"n") ENTERCORRECTLY=3D0;;
> +				*)  echo "Please enter y or n";ENTERCORRECTLY=3D0;;
> +				esac
> +
> +		else
> +			echo "Invalid path make sure to include complete path"
> +
> +			ENTERCORRECTLY=3D0
> +		fi
> +	done
> +	echo ""
> +
> +
> +	# Check if user entered a tar or not for Boot
> +	ISBOOTTAR=3D`ls $BOOTUSERFILEPATH | grep .tar.gz | awk {'print $1'}`
> +	if [ -n "$ISBOOTTAR" ]
> +	then
> +		BOOTPATHOPTION=3D2
> +	else
> +		BOOTPATHOPTION=3D1
> +		BOOTFILEPATH=3D$BOOTUSERFILEPATH
> +		MLO=3D`ls $BOOTFILEPATH | grep MLO | awk {'print $1'}`
> +		UIMAGE=3D`ls $BOOTFILEPATH | grep uImage | awk {'print $1'}`
> +		BOOTIMG=3D`ls $BOOTFILEPATH | grep u-boot | grep .img | awk {'print $1=
'}`
> +		BOOTBIN=3D`ls $BOOTFILEPATH | grep u-boot | grep .bin | awk {'print $1=
'}`
> +	fi
> +
> +	#Check if user entered a tar or not for Rootfs
> +	ISROOTFSTAR=3D`ls $ROOTFSUSERFILEPATH | grep .tar.gz | awk {'print $1'}=
`
> +	if [ -n "$ISROOTFSTAR" ]
> +	then
> +		ROOTFSPATHOPTION=3D2
> +	else
> +		ROOTFSPATHOPTION=3D1
> +		ROOTFSFILEPATH=3D$ROOTFSUSERFILEPATH
> +	fi
> +fi
> +
> +cat << EOM
> +########################################################################=
########
> +
> +	Copying files now... will take minutes
> +
> +########################################################################=
########
> +
> +Copying boot partition
> +EOM
> +
> +
> +if [ $BOOTPATHOPTION -eq 1 ] ; then
> +
> +	echo ""
> +	#copy boot files out of board support
> +	if [ "$MLO" !=3D "" ] ; then
> +		cp $BOOTFILEPATH/$MLO $PATH_TO_SDBOOT/MLO
> +		echo "MLO copied"
> +	else
> +		echo "MLO file not found"
> +	fi
> +
> +	echo ""
> +
> +	if [ "$BOOTBIN" !=3D "" ] ; then
> +		cp $BOOTFILEPATH/$BOOTBIN $PATH_TO_SDBOOT/u-boot.bin
> +		echo "u-boot.bin copied"
> +	else
> +		echo "u-boot.bin file not found"
> +	fi
> +
> +	echo ""
> +
> +	if [ "$BOOTIMG" !=3D "" ] ; then
> +		cp $BOOTFILEPATH/$BOOTIMG $PATH_TO_SDBOOT/u-boot.img
> +		echo "u-boot.img copied"
> +	else
> +		echo "u-boot.img file not found"
> +	fi
> +
> +	echo ""
> +
> +	if [ "$UIMAGE" !=3D "" ] ; then
> +		cp $BOOTFILEPATH/$UIMAGE $PATH_TO_SDBOOT/uImage
> +		echo "uImage copied"
> +	else
> +		echo "uImage file not found"
> +	fi
> +
> +elif [ $BOOTPATHOPTION -eq 2  ] ; then
> +	untar_progress $BOOTUSERFILEPATH $PATH_TO_TMP_DIR
> +	cp -rf $PATH_TO_TMP_DIR/* $PATH_TO_SDBOOT
> +	echo ""
> +
> +fi
> +
> +echo ""
> +sync
> +
> +echo "Copying rootfs System partition"
> +if [ $ROOTFSPATHOPTION -eq 1 ] ; then
> +	TOTALSIZE=3D`sudo du -c $ROOTFSUSERFILEPATH/* | grep total | awk {'prin=
t $1'}`
> +	sudo cp -r $ROOTFSUSERFILEPATH/* $PATH_TO_SDROOTFS & cp_progress $TOTAL=
SIZE $PATH_TO_SDROOTFS
> +
> +elif [ $ROOTFSPATHOPTION -eq 2  ] ; then
> +	untar_progress $ROOTFSUSERFILEPATH $PATH_TO_SDROOTFS
> +fi
> +
> +echo ""
> +echo ""
> +echo "Syncing..."
> +sync
> +sync
> +sync
> +sync
> +sync
> +sync
> +sync
> +sync
> +
> +
> +echo " "
> +echo "Un-mount the partitions "
> +sudo umount -f $PATH_TO_SDBOOT
> +sudo umount -f $PATH_TO_SDROOTFS
> +
> +
> +echo " "
> +echo "Remove created temp directories "
> +sudo rm -rf $PATH_TO_TMP_DIR
> +sudo rm -rf $PATH_TO_SDROOTFS
> +sudo rm -rf $PATH_TO_SDBOOT
> +
> +
> +echo " "
> +echo "Operation Finished"
> +echo " "
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setu=
p/setup-host-check.sh b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-t=
isdk-setup/setup-host-check.sh
> new file mode 100644
> index 0000000..ec32030
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup/setup=
-host-check.sh
> @@ -0,0 +1,43 @@
> +#!/bin/sh
> +
> +# This distribution contains contributions or derivatives under copyrigh=
t
> +# as follows:
> +#
> +# Copyright (c) 2010, Texas Instruments Incorporated
> +# All rights reserved.
> +#
> +# Redistribution and use in source and binary forms, with or without
> +# modification, are permitted provided that the following conditions
> +# are met:
> +# - Redistributions of source code must retain the above copyright notic=
e,
> +#   this list of conditions and the following disclaimer.
> +# - Redistributions in binary form must reproduce the above copyright
> +#   notice, this list of conditions and the following disclaimer in the
> +#   documentation and/or other materials provided with the distribution.
> +# - Neither the name of Texas Instruments nor the names of its
> +#   contributors may be used to endorse or promote products derived
> +#   from this software without specific prior written permission.
> +#
> +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
> +# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMI=
TED
> +# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTIC=
ULAR
> +# PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
> +# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
> +# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
> +# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
> +# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
> +# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING N=
EGLIGENCE
> +# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN=
 IF
> +# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> +
> +echo
> +echo "------------------------------------------------------------------=
--------------"
> +echo "Verifying Linux host distribution"
> +host=3D`lsb_release -a 2>/dev/null | grep Codename: | awk {'print $2'}`
> +if [ "$host" !=3D "lucid" ]; then
> +    echo "Unsupported host machine, only Ubuntu 10.04 LTS supported"
> +    exit 1
> +fi
> +echo "Ubuntu 10.04 LTS found successfully, continuing.."
> +echo "------------------------------------------------------------------=
--------------"
> +echo
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setu=
p/setup-minicom.sh b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisd=
k-setup/setup-minicom.sh
> new file mode 100644
> index 0000000..d099b2f
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup/setup=
-minicom.sh
> @@ -0,0 +1,101 @@
> +#!/bin/sh
> +
> +# This distribution contains contributions or derivatives under copyrigh=
t
> +# as follows:
> +#
> +# Copyright (c) 2010, Texas Instruments Incorporated
> +# All rights reserved.
> +#
> +# Redistribution and use in source and binary forms, with or without
> +# modification, are permitted provided that the following conditions
> +# are met:
> +# - Redistributions of source code must retain the above copyright notic=
e,
> +#   this list of conditions and the following disclaimer.
> +# - Redistributions in binary form must reproduce the above copyright
> +#   notice, this list of conditions and the following disclaimer in the
> +#   documentation and/or other materials provided with the distribution.
> +# - Neither the name of Texas Instruments nor the names of its
> +#   contributors may be used to endorse or promote products derived
> +#   from this software without specific prior written permission.
> +#
> +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
> +# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMI=
TED
> +# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTIC=
ULAR
> +# PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
> +# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
> +# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
> +# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
> +# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
> +# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING N=
EGLIGENCE
> +# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN=
 IF
> +# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> +
> +cwd=3D`dirname $0`
> +. $cwd/common.sh
> +
> +
> +minicomcfg=3D${HOME}/.minirc.dfl
> +
> +echo
> +echo "------------------------------------------------------------------=
--------------"
> +echo "This step will set up minicom (serial communication application) f=
or"
> +echo "SDK development"
> +echo
> +echo
> +echo "For boards that contain a USB-to-Serial converter on the board (Be=
agleBone), "
> +echo "the port used for minicom will be automatically detected. By defau=
lt Ubuntu "
> +echo "will not recognize this device. Setup will add a udev rule to "
> +echo "/etc/udev/ so that from now on it will be recognized as soon as th=
e board is "
> +echo "plugged in."
> +echo
> +echo "For other boards, the serial will defualt to /dev/ttyS0. Please up=
date based "
> +echo "on your setup."
> +
> +echo "------------------------------------------------------------------=
--------------"
> +echo
> +
> +portdefault=3D/dev/ttyS0
> +
> +echo ""
> +echo "NOTE: For boards with a built-in USB to Serial adapter please pres=
s"
> +echo "      ENTER at the prompt below.  The correct port will be determi=
ned"
> +echo "      automatically at a later step.  For all other boards select"
> +echo "      the serial port that the board is connected to"
> +echo "Which serial port do you want to use with minicom?"
> +read -p "[ $portdefault ] " port
> +
> +if [ ! -n "$port" ]; then
> +    port=3D$portdefault
> +fi
> +
> +if [ -f $minicomcfg ]; then
> +    cp $minicomcfg $minicomcfg.old
> +    echo
> +    echo "Copied existing $minicomcfg to $minicomcfg.old"
> +fi
> +
> +echo "pu port             $port
> +pu baudrate         115200
> +pu bits             8
> +pu parity           N
> +pu stopbits         1
> +pu minit
> +pu mreset
> +pu mdialpre
> +pu mdialsuf
> +pu mdialpre2
> +pu mdialsuf2
> +pu mdialpre3
> +pu mdialsuf3
> +pu mconnect
> +pu mnocon1          NO CARRIER
> +pu mnocon2          BUSY
> +pu mnocon3          NO DIALTONE
> +pu mnocon4          VOICE
> +pu rtscts           No" | tee $minicomcfg > /dev/null
> +check_status
> +
> +echo
> +echo "Configuration saved to $minicomcfg. You can change it further from=
 inside"
> +echo "minicom, see the Software Development Guide for more information."
> +echo "------------------------------------------------------------------=
--------------"
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setu=
p/setup-package-install.sh b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup=
/ti-tisdk-setup/setup-package-install.sh
> new file mode 100644
> index 0000000..cc75337
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup/setup=
-package-install.sh
> @@ -0,0 +1,50 @@
> +#!/bin/sh
> +
> +# This distribution contains contributions or derivatives under copyrigh=
t
> +# as follows:
> +#
> +# Copyright (c) 2010, Texas Instruments Incorporated
> +# All rights reserved.
> +#
> +# Redistribution and use in source and binary forms, with or without
> +# modification, are permitted provided that the following conditions
> +# are met:
> +# - Redistributions of source code must retain the above copyright notic=
e,
> +#   this list of conditions and the following disclaimer.
> +# - Redistributions in binary form must reproduce the above copyright
> +#   notice, this list of conditions and the following disclaimer in the
> +#   documentation and/or other materials provided with the distribution.
> +# - Neither the name of Texas Instruments nor the names of its
> +#   contributors may be used to endorse or promote products derived
> +#   from this software without specific prior written permission.
> +#
> +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
> +# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMI=
TED
> +# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTIC=
ULAR
> +# PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
> +# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
> +# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
> +# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
> +# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
> +# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING N=
EGLIGENCE
> +# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN=
 IF
> +# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> +
> +. `dirname $0`/common.sh
> +
> +cmd=3D"sudo apt-get install xinetd tftpd nfs-kernel-server minicom build=
-essential libncurses5-dev uboot-mkimage autoconf automake"
> +echo "------------------------------------------------------------------=
--------------"
> +echo "This step will make sure you have the proper host support packages=
 installed"
> +echo "using the following command: $cmd"
> +echo
> +echo "Note! This command requires you to have administrator priviliges (=
sudo access) "
> +echo "on your host."
> +read -p "Press return to continue" REPLY
> +
> +echo
> +$cmd
> +check_status
> +echo
> +echo "Package verification and installation successfully completed"
> +echo "------------------------------------------------------------------=
--------------"
> +echo
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setu=
p/setup-targetfs-nfs.sh b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti=
-tisdk-setup/setup-targetfs-nfs.sh
> new file mode 100644
> index 0000000..595f432
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup/setup=
-targetfs-nfs.sh
> @@ -0,0 +1,153 @@
> +#!/bin/sh
> +
> +# This distribution contains contributions or derivatives under copyrigh=
t
> +# as follows:
> +#
> +# Copyright (c) 2010, Texas Instruments Incorporated
> +# All rights reserved.
> +#
> +# Redistribution and use in source and binary forms, with or without
> +# modification, are permitted provided that the following conditions
> +# are met:
> +# - Redistributions of source code must retain the above copyright notic=
e,
> +#   this list of conditions and the following disclaimer.
> +# - Redistributions in binary form must reproduce the above copyright
> +#   notice, this list of conditions and the following disclaimer in the
> +#   documentation and/or other materials provided with the distribution.
> +# - Neither the name of Texas Instruments nor the names of its
> +#   contributors may be used to endorse or promote products derived
> +#   from this software without specific prior written permission.
> +#
> +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
> +# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMI=
TED
> +# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTIC=
ULAR
> +# PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
> +# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
> +# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
> +# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
> +# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
> +# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING N=
EGLIGENCE
> +# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN=
 IF
> +# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> +
> +cwd=3D`dirname $0`
> +. $cwd/common.sh
> +
> +SDKinstall=3D`grep TI_SDK_PATH=3D $cwd/../Rules.make | cut -d=3D -f2`
> +
> +dstdefault=3D$SDKinstall/targetNFS
> +
> +
> +echo "------------------------------------------------------------------=
--------------"
> +echo "In which directory do you want to install the target filesystem?(i=
f this directory does not exist it will be created)"
> +read -p "[ $dstdefault ] " dst
> +
> +if [ ! -n "$dst" ]; then
> +    dst=3D$dstdefault
> +fi
> +echo "------------------------------------------------------------------=
--------------"
> +
> +echo
> +echo "------------------------------------------------------------------=
--------------"
> +echo "This step will extract the target filesystem to $dst"
> +echo
> +echo "Note! This command requires you to have administrator priviliges (=
sudo access) "
> +echo "on your host."
> +read -p "Press return to continue" REPLY
> +
> +extract_fs() {
> +    fstar=3D`ls -1 $cwd/../filesystem/??sdk*rootfs*.tar.gz`
> +    me=3D`whoami`
> +    sudo mkdir -p $1
> +    check_status
> +    sudo tar xzf $fstar -C $1
> +    check_status
> +    sudo chown $me:$me $1
> +    check_status
> +    sudo chown -R $me:$me $1/home $1/usr $1/etc $1/lib $1/opt $1/boot
> +    check_status
> +    echo
> +    echo "Successfully extracted `basename $fstar` to $1"
> +}
> +
> +if [ -d $dst ]; then
> +    echo "$dst already exists"
> +    echo "(r) rename existing filesystem (o) overwrite existing filesyst=
em (s) skip filesystem extraction"
> +    read -p "[r] " exists
> +    case "$exists" in
> +      s) echo "Skipping filesystem extraction"
> +         echo "WARNING! Keeping the previous filesystem may cause compat=
ibility problems if you are upgrading the SDK"
> +         ;;
> +      o) sudo rm -rf $dst
> +         echo "Old $dst removed"
> +         extract_fs $dst
> +         ;;
> +      *) dte=3D"`date +%m%d%Y`_`date +%H`.`date +%M`"
> +         echo "Path for old filesystem:"
> +         read -p "[ $dst.$dte ]" old
> +         if [ ! -n "$old" ]; then
> +             old=3D"$dst.$dte"
> +         fi
> +         sudo mv $dst $old
> +         check_status
> +         echo
> +         echo "Successfully moved old $dst to $old"
> +         extract_fs $dst
> +         ;;
> +    esac
> +else
> +    extract_fs $dst
> +fi
> +echo $dst > $cwd/../.targetfs
> +echo "set sysroot $dst" > $cwd/../.gdbinit
> +echo "------------------------------------------------------------------=
--------------"
> +
> +platform=3D`grep PLATFORM=3D $cwd/../Rules.make | cut -d=3D -f2`
> +echo
> +echo "------------------------------------------------------------------=
--------------"
> +echo "This step will set up the SDK to install binaries in to:"
> +echo "    $dst/home/root/$platform"
> +echo
> +echo "The files will be available from /home/root/$platform on the targe=
t."
> +echo
> +echo "This setting can be changed later by editing Rules.make and changi=
ng the"
> +echo "EXEC_DIR or DESTDIR variable (depending on your SDK)."
> +echo
> +read -p "Press return to continue" REPLY
> +
> +sed -i "s=3DEXEC_DIR\=3D.*$=3DEXEC_DIR\=3D$dst/home/root/$platform=3Dg" =
$cwd/../Rules.make
> +check_status
> +
> +sed -i "s=3DDESTDIR\=3D.*$=3DDESTDIR\=3D$dst=3Dg" $cwd/../Rules.make
> +check_status
> +
> +echo "Rules.make edited successfully.."
> +echo "------------------------------------------------------------------=
--------------"
> +
> +echo
> +echo "------------------------------------------------------------------=
--------------"
> +echo "This step will export your target filesystem for NFS access."
> +echo
> +echo "Note! This command requires you to have administrator priviliges (=
sudo access) "
> +echo "on your host."
> +read -p "Press return to continue" REPLY
> +
> +grep $dst /etc/exports > /dev/null
> +if [ "$?" -eq "0" ]; then
> +    echo "$dst already NFS exported, skipping.."
> +else
> +    sudo chmod 666 /etc/exports
> +    check_status
> +    sudo echo "$dst *(rw,nohide,insecure,no_subtree_check,async,no_root_=
squash)" >> /etc/exports
> +    check_status
> +    sudo chmod 644 /etc/exports
> +    check_status
> +fi
> +
> +echo
> +sudo /etc/init.d/nfs-kernel-server stop
> +check_status
> +sleep 1
> +sudo /etc/init.d/nfs-kernel-server start
> +check_status
> +echo "------------------------------------------------------------------=
--------------"
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setu=
p/setup-tftp.sh b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-s=
etup/setup-tftp.sh
> new file mode 100644
> index 0000000..b11a76b
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup/setup=
-tftp.sh
> @@ -0,0 +1,150 @@
> +#!/bin/sh
> +
> +# This distribution contains contributions or derivatives under copyrigh=
t
> +# as follows:
> +#
> +# Copyright (c) 2010, Texas Instruments Incorporated
> +# All rights reserved.
> +#
> +# Redistribution and use in source and binary forms, with or without
> +# modification, are permitted provided that the following conditions
> +# are met:
> +# - Redistributions of source code must retain the above copyright notic=
e,
> +#   this list of conditions and the following disclaimer.
> +# - Redistributions in binary form must reproduce the above copyright
> +#   notice, this list of conditions and the following disclaimer in the
> +#   documentation and/or other materials provided with the distribution.
> +# - Neither the name of Texas Instruments nor the names of its
> +#   contributors may be used to endorse or promote products derived
> +#   from this software without specific prior written permission.
> +#
> +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
> +# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMI=
TED
> +# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTIC=
ULAR
> +# PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
> +# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
> +# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
> +# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
> +# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
> +# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING N=
EGLIGENCE
> +# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN=
 IF
> +# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> +
> +cwd=3D`dirname $0`
> +. $cwd/common.sh
> +
> +tftpcfg=3D/etc/xinetd.d/tftp
> +tftprootdefault=3D/tftpboot
> +
> +tftp() {
> +    echo "
> +service tftp
> +{
> +protocol =3D udp
> +port =3D 69
> +socket_type =3D dgram
> +wait =3D yes
> +user =3D nobody
> +server =3D /usr/sbin/in.tftpd
> +server_args =3D $tftproot
> +disable =3D no
> +}
> +" | sudo tee $tftpcfg > /dev/null
> +     check_status
> +     echo
> +     echo "$tftpcfg successfully created"
> +}
> +
> +echo "------------------------------------------------------------------=
--------------"
> +echo "Which directory do you want to be your tftp root directory?(if thi=
s directory does not exist it will be created for you)"
> +read -p "[ $tftprootdefault ] " tftproot
> +
> +if [ ! -n "$tftproot" ]; then
> +    tftproot=3D$tftprootdefault
> +fi
> +echo $tftproot > $cwd/../.tftproot
> +echo "------------------------------------------------------------------=
--------------"
> +
> +echo
> +echo "------------------------------------------------------------------=
--------------"
> +echo "This step will set up the tftp server in the $tftproot directory."
> +echo
> +echo "Note! This command requires you to have administrator priviliges (=
sudo access) "
> +echo "on your host."
> +read -p "Press return to continue" REPLY
> +
> +if [ -d $tftproot ]; then
> +    echo
> +    echo "$tftproot already exists, not creating.."
> +else
> +    sudo mkdir -p $tftproot
> +    check_status
> +    sudo chmod 777 $tftproot
> +    check_status
> +    sudo chown nobody $tftproot
> +    check_status
> +fi
> +
> +platform=3D`cat $cwd/../Rules.make | grep -e "^PLATFORM=3D" | cut -d=3D =
-f2`
> +uimage=3D"uImage-""$platform"".bin"
> +uimagesrc=3D`ls -1 $cwd/../board-support/prebuilt-images/$uimage`
> +if [ -f $tftproot/$uimage ]; then
> +    echo
> +    echo "$tftproot/$uimage already exists. The existing installed file =
can be renamed and saved under the new name."
> +    echo "(r) rename (o) overwrite (s) skip copy "
> +    read -p "[r] " exists
> +    case "$exists" in
> +      s) echo "Skipping copy of $uimage, existing version will be used"
> +         ;;
> +      o) sudo cp $uimagesrc $tftproot
> +         check_status
> +         echo
> +         echo "Successfully overwritten $uimage in tftp root directory $=
tftproot"
> +         ;;
> +      *) dte=3D"`date +%m%d%Y`_`date +%H`.`date +%M`"
> +         echo "New name for existing uImage: "
> +         read -p "[ $uimage.$dte ]" newname
> +         if [ ! -n "$newname" ]; then
> +             newname=3D"$uimage.$dte"
> +         fi
> +         sudo mv "$tftproot/$uimage" "$tftproot/$newname"
> +         check_status
> +         sudo cp $uimagesrc $tftproot
> +         check_status
> +         echo
> +         echo "Successfully copied $uimage to tftp root directory $tftpr=
oot as $newname"
> +         ;;
> +    esac
> +else
> +    sudo cp $uimagesrc $tftproot
> +    check_status
> +    echo
> +    echo "Successfully copied $uimage to tftp root directory $tftproot"
> +fi
> +
> +echo
> +if [ -f $tftpcfg ]; then
> +    echo "$tftpcfg already exists.."
> +
> +    #Use =3D instead of =3D=3D for POSIX and dash shell compliance
> +    if [ "`cat $tftpcfg | grep server_args | cut -d=3D -f2 | sed 's/^[ ]=
*//'`" \
> +          =3D "$tftproot" ]; then
> +        echo "$tftproot already exported for TFTP, skipping.."
> +    else
> +        echo "Copying old $tftpcfg to $tftpcfg.old"
> +        sudo cp $tftpcfg $tftpcfg.old
> +        check_status
> +        tftp
> +    fi
> +else
> +    tftp
> +fi
> +
> +echo
> +echo "Restarting tftp server"
> +sudo /etc/init.d/xinetd stop
> +check_status
> +sleep 1
> +sudo /etc/init.d/xinetd start
> +check_status
> +echo "------------------------------------------------------------------=
--------------"
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setu=
p/setup-uboot-env-am18x.sh b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup=
/ti-tisdk-setup/setup-uboot-env-am18x.sh
> new file mode 100644
> index 0000000..f486dda
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup/setup=
-uboot-env-am18x.sh
> @@ -0,0 +1,308 @@
> +#!/bin/sh
> +
> +# This distribution contains contributions or derivatives under copyrigh=
t
> +# as follows:
> +#
> +# Copyright (c) 2010, Texas Instruments Incorporated
> +# All rights reserved.
> +#
> +# Redistribution and use in source and binary forms, with or without
> +# modification, are permitted provided that the following conditions
> +# are met:
> +# - Redistributions of source code must retain the above copyright notic=
e,
> +#   this list of conditions and the following disclaimer.
> +# - Redistributions in binary form must reproduce the above copyright
> +#   notice, this list of conditions and the following disclaimer in the
> +#   documentation and/or other materials provided with the distribution.
> +# - Neither the name of Texas Instruments nor the names of its
> +#   contributors may be used to endorse or promote products derived
> +#   from this software without specific prior written permission.
> +#
> +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
> +# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMI=
TED
> +# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTIC=
ULAR
> +# PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
> +# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
> +# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
> +# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
> +# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
> +# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING N=
EGLIGENCE
> +# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN=
 IF
> +# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> +
> +cwd=3D`dirname $0`
> +. $cwd/common.sh
> +
> +echo
> +echo "------------------------------------------------------------------=
--------------"
> +echo "This step will set up the u-boot variables for booting the EVM."
> +
> +SDKinstall=3D`grep TI_SDK_PATH=3D $cwd/../Rules.make | cut -d=3D -f2`
> +
> +dstdefault=3D$SDKinstall/targetNFS
> +
> +
> +ipdefault=3D`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d:=
 -f2 | awk '{ print $1 }'`
> +platform=3D`grep PLATFORM=3D $cwd/../Rules.make | cut -d=3D -f2`
> +prompt=3D" >"
> +
> +echo "Autodetected the following ip address of your host, correct it if =
necessary"
> +read -p "[ $ipdefault ] " ip
> +echo
> +
> +if [ ! -n "$ip" ]; then
> +    ip=3D$ipdefault
> +fi
> +
> +if [ -f $cwd/../.targetfs ]; then
> +    rootpath=3D`cat $cwd/../.targetfs`
> +else
> +    echo "Where is your target filesystem extracted?"
> +    read -p "[ $dstdefault ]" rootpath
> +
> +    if [ ! -n "$rootpath" ]; then
> +        rootpath=3D"$dstdefault"
> +    fi
> +    echo
> +fi
> +
> +if [ -f $cwd/../.tftproot ]; then
> +    tftproot=3D`cat $cwd/../.tftproot`
> +else
> +    echo "Where is your TFTP root?"
> +    read -p "[ /tftpboot ] " tftproot
> +
> +    if [ ! -n "$tftproot" ]; then
> +        tftproot=3D"/tftpboot"
> +    fi
> +    echo
> +fi
> +
> +uimage=3D"uImage-""$platform"".bin"
> +uimagesrc=3D`ls -1 $cwd/../board-support/prebuilt-images/$uimage`
> +uimagedefault=3D`basename $uimagesrc`
> +
> +baseargs=3D"console=3DttyS2,115200n8 rw noinitrd"
> +videoargs=3D""
> +extendbaseargs=3D""
> +fssdargs=3D"root=3D/dev/mmcblk0p2 rootfstype=3Dext3 rootwait"
> +fsnfsargs1=3D"root=3D/dev/nfs nfsroot=3D"
> +fsnfsargs2=3D"$ip:"
> +fsnfsargs3=3D"$rootpath"
> +fsnfsargs4=3D",nolock,rsize=3D1024,wsize=3D1024"
> +fsnfsargs=3D$fsnfsargs1$fsnfsargs2$fsnfsargs3$fsnfsargs4
> +
> +echo "Select Linux kernel location:"
> +echo " 1: TFTP"
> +echo " 2: SD card"
> +echo " 3: flash"
> +echo
> +read -p "[ 1 ] " kernel
> +
> +if [ ! -n "$kernel" ]; then
> +    kernel=3D"1"
> +fi
> +
> +echo
> +echo "Select root file system location:"
> +echo " 1: NFS"
> +echo " 2: SD card"
> +echo
> +read -p "[ 1 ] " fs
> +
> +if [ ! -n "$fs" ]; then
> +    fs=3D"1"
> +fi
> +
> +if [ "$kernel" -eq "1" ]; then
> +    echo
> +    echo "Available kernel images in $tftproot:"
> +    for file in $tftproot/*; do
> +        basefile=3D`basename $file`
> +        echo "    $basefile"
> +    done
> +    if [ ! -f $tftproot/$uimagedefault ]; then
> +        uimagedefault=3D`ls -1 $tftproot/* | head -1`
> +        uimagedefault=3D`basename $uimagedefault`
> +    fi
> +    echo
> +    echo "Which kernel image do you want to boot from TFTP?"
> +    read -p "[ $uimagedefault ] " uimage
> +
> +    if [ ! -n "$uimage" ]; then
> +        uimage=3D$uimagedefault
> +    fi
> +
> +#    bootcmd=3D"setenv bootcmd 'dhcp;bootm'"
> +    bootcmd=3D"setenv bootcmd 'dhcp;setenv serverip $ip;tftpboot;bootm'"
> +    serverip=3D"setenv serverip $ip"
> +    bootfile=3D"setenv bootfile $uimage"
> +
> +    if [ "$fs" -eq "1" ]; then
> +        bootargs=3D"setenv bootargs $baseargs $extendbaseargs $videoargs=
 $fsnfsargs ip=3Ddhcp"
> +        cfg=3D"uimage-tftp_fs-nfs"
> +    else
> +        bootargs=3D"setenv bootargs $baseargs $extendbaseargs $videoargs=
 $fssdargs ip=3Dnone"
> +        cfg=3D"uimage-tftp_fs-sd"
> +    fi
> +else
> +    if [ "$kernel" -eq "2" ]; then
> +
> +        if [ "$fs" -eq "1" ]; then
> +            bootargs=3D"setenv bootargs $baseargs $extendbaseargs $video=
args $fsnfsargs ip=3Ddhcp"
> +            bootcmd=3D"setenv bootcmd 'mmc rescan 0; fatload mmc 0 0xc07=
00000 uImage; bootm 0xc0700000'"
> +            cfg=3D"uimage-sd_fs-nfs"
> +        else
> +            bootargs=3D"setenv bootargs $baseargs $extendbaseargs $video=
args $fssdargs ip=3Dnone"
> +            bootcmd=3D"setenv bootcmd 'mmc rescan 0; fatload mmc 0 0xc07=
00000 uImage; bootm 0xc0700000'"
> +            cfg=3D"uimage-sd_fs-sd"
> +        fi
> +    else
> +        if [ "$fs" -eq "1" ]; then
> +            bootargs=3D"setenv bootargs $baseargs $extendbaseargs $video=
args $fsnfsargs ip=3Ddhcp"
> +            bootcmd=3D"setenv bootcmd 'sf probe 0; sf read 0xc0700000 0x=
80000 0x280000; bootm 0xc0700000'"
> +            cfg=3D"uimage-flash_fs-nfs"
> +        else
> +            bootargs=3D"setenv bootargs $baseargs $extendbaseargs $video=
args $fssdargs ip=3Dnone"
> +            bootcmd=3D"setenv bootcmd 'sf probe 0; sf read 0xc0700000 0x=
80000 0x280000; bootm 0xc0700000'"
> +            cfg=3D"uimage-flash_fs-sd"
> +	fi
> +    fi
> +fi
> +
> +echo
> +echo "Resulting u-boot variable settings:"
> +echo
> +echo "setenv bootdelay 3"
> +echo "setenv baudrate 115200"
> +echo $bootargs
> +echo $bootcmd
> +
> +if [ -n "$serverip" ]; then
> +    echo "setenv autoload no"
> +    echo $serverip
> +fi
> +
> +if [ -n "$bootfile" ]; then
> +    echo $bootfile
> +fi
> +echo "------------------------------------------------------------------=
--------------"
> +
> +do_expect() {
> +    echo "expect {" >> $3
> +    check_status
> +    echo "    $1" >> $3
> +    check_status
> +    echo "}" >> $3
> +    check_status
> +    echo $2 >> $3
> +    check_status
> +    echo >> $3
> +}
> +
> +echo
> +echo "------------------------------------------------------------------=
--------------"
> +echo "Would you like to create a minicom script with the above parameter=
s (y/n)?"
> +read -p "[ y ] " minicom
> +echo
> +
> +if [ ! -n "$minicom" ]; then
> +    minicom=3D"y"
> +fi
> +
> +#Use =3D instead of =3D=3D for POSIX compliance and dash compatibility
> +if [ "$minicom" =3D "y" ]; then
> +    minicomfile=3Dsetup_$platform_$cfg.minicom
> +    minicomfilepath=3D$cwd/../$minicomfile
> +
> +    if [ -f $minicomfilepath ]; then
> +        echo "Moving existing $minicomfile to $minicomfile.old"
> +        mv $minicomfilepath $minicomfilepath.old
> +        check_status
> +    fi
> +
> +    timeout=3D300
> +    echo "timeout $timeout" >> $minicomfilepath
> +    echo "verbose on" >> $minicomfilepath
> +    echo >> $minicomfilepath
> +    do_expect "\"stop autoboot:\"" "send \"\"" $minicomfilepath
> +    do_expect "\"$prompt\"" "send \"setenv bootdelay 4\"" $minicomfilepa=
th
> +    do_expect "\"$prompt\"" "send \"setenv baudrate 115200\"" $minicomfi=
lepath
> +    do_expect "\"ENTER ...\"" "send \"\"" $minicomfilepath
> +    do_expect "\"$prompt\"" "send \"setenv oldbootargs \$\{bootargs\}\""=
 $minicomfilepath
> +
> +#   For dash compatibility need to use printf instead of echo
> +#   because dash shell will expand the \c by default
> +#   do_expect "\"$prompt\"" "send \"setenv bootargs $baseargs \c\"" $min=
icomfilepath
> +    echo "expect {" >> $minicomfilepath
> +    check_status
> +    echo "    \"$prompt\"" >> $minicomfilepath
> +    check_status
> +    echo "}" >> $minicomfilepath
> +    check_status
> +    printf "send \"setenv bootargs $baseargs \c\"\n" >> $minicomfilepath
> +    check_status
> +
> +#   For dash compatibility need to use printf instead of echo
> +#   printf "send \"$extendbaseargs \c\"\n" >> $minicomfilepath
> +#   printf "send \"$videoargs1 \c\"\n" >> $minicomfilepath
> +#   printf "send \"$videoargs2 \c\"\n" >> $minicomfilepath
> +#   printf "send \"$videoargs3 \c\"\n" >> $minicomfilepath
> +    if [ "$fs" -eq "1" ]; then
> +        printf "send \"$fsnfsargs1\c\"\n" >> $minicomfilepath
> +        printf "send \"$fsnfsargs2\c\"\n" >> $minicomfilepath
> +        printf "send \"$fsnfsargs3\c\"\n" >> $minicomfilepath
> +        printf "send \"$fsnfsargs4 \c\"\n" >> $minicomfilepath
> +        echo "send \"ip=3Ddhcp\"" >> $minicomfilepath
> +    else
> +        printf "send \"$fssdargs \c\"\n" >> $minicomfilepath
> +        echo "send \"ip=3Doff\"" >> $minicomfilepath
> +    fi
> +    if [ "$kernel" -eq "1" ]; then
> +        do_expect "\"$prompt\"" "send \"setenv autoload no\"" $minicomfi=
lepath
> +        do_expect "\"$prompt\"" "send \"setenv oldserverip \$\{serverip\=
}\"" $minicomfilepath
> +        do_expect "\"$prompt\"" "send \"$serverip\"" $minicomfilepath
> +#        do_expect "\"$prompt\"" "send \"setenv oldbootfile \$\{bootfile=
\}\"" $minicomfilepath
> +        do_expect "\"$prompt\"" "send \"$bootfile\"" $minicomfilepath
> +    fi
> +    do_expect "\"$prompt\"" "send \"setenv oldbootcmd \$\{bootcmd\}\"" $=
minicomfilepath
> +    do_expect "\"$prompt\"" "send \"$bootcmd\"" $minicomfilepath
> +    do_expect "\"$prompt\"" "send \"saveenv\"" $minicomfilepath
> +    do_expect "\"$prompt\"" "! killall -s SIGHUP minicom" $minicomfilepa=
th
> +
> +    echo -n "Successfully wrote "
> +    readlink -m $minicomfilepath
> +
> +    echo
> +    echo "Would you like to run the setup script now (y/n)? This require=
s you to connect"
> +    echo "the RS-232 cable between your host and EVM as well as your eth=
ernet cable as"
> +    echo "described in the Quick Start Guide. Once answering 'y' on the =
prompt below"
> +    echo "you will have $timeout seconds to connect the board and power =
cycle it"
> +    echo "before the setup times out."
> +    echo
> +    echo "After successfully executing this script, your EVM will be set=
 up. You will be "
> +    echo "able to connect to it by executing 'minicom -w' or if you pref=
er a windows host"
> +    echo "you can set up Tera Term as explained in the Software Develope=
r's Guide."
> +    echo "If you connect minicom or Tera Term and power cycle the board =
Linux will boot."
> +    echo
> +    read -p "[ y ] " minicomsetup
> +
> +    if [ ! -n "$minicomsetup" ]; then
> +        minicomsetup=3D"y"
> +    fi
> +
> +    savedir=3D""
> +    #Use =3D instead of =3D=3D for POSIX compliance and dash compatibili=
ty
> +    if [ "$minicomsetup" =3D "y" ]; then
> +        #For dash compatibility, do not use pushd & popd
> +        savedir=3D$cwd
> +	cd "$cwd/.."
> +        check_status
> +        minicom -S $minicomfile
> +        cd $savedir
> +        check_status
> +    fi
> +
> +    echo "You can manually run minicom in the future with this setup scr=
ipt using: minicom -S $minicomfile"
> +fi
> +echo "------------------------------------------------------------------=
--------------"
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setu=
p/setup-uboot-env-am335x.sh b/meta-arago-distro/recipes-tisdk/ti-tisdk-setu=
p/ti-tisdk-setup/setup-uboot-env-am335x.sh
> new file mode 100644
> index 0000000..600e3ad
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup/setup=
-uboot-env-am335x.sh
> @@ -0,0 +1,409 @@
> +#!/bin/sh
> +
> +# This distribution contains contributions or derivatives under copyrigh=
t
> +# as follows:
> +#
> +# Copyright (c) 2010, Texas Instruments Incorporated
> +# All rights reserved.
> +#
> +# Redistribution and use in source and binary forms, with or without
> +# modification, are permitted provided that the following conditions
> +# are met:
> +# - Redistributions of source code must retain the above copyright notic=
e,
> +#   this list of conditions and the following disclaimer.
> +# - Redistributions in binary form must reproduce the above copyright
> +#   notice, this list of conditions and the following disclaimer in the
> +#   documentation and/or other materials provided with the distribution.
> +# - Neither the name of Texas Instruments nor the names of its
> +#   contributors may be used to endorse or promote products derived
> +#   from this software without specific prior written permission.
> +#
> +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
> +# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMI=
TED
> +# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTIC=
ULAR
> +# PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
> +# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
> +# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
> +# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
> +# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
> +# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING N=
EGLIGENCE
> +# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN=
 IF
> +# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> +
> +cwd=3D`dirname $0`
> +. $cwd/common.sh
> +
> +do_expect() {
> +    echo "expect {" >> $3
> +    check_status
> +    echo "    $1" >> $3
> +    check_status
> +    echo "}" >> $3
> +    check_status
> +    echo $2 >> $3
> +    check_status
> +    echo >> $3
> +}
> +
> +
> +echo
> +echo "------------------------------------------------------------------=
--------------"
> +echo "This step will set up the u-boot variables for booting the EVM."
> +echo "Becuase the not all AM335x devices have a NAND, the u-boot variabl=
es will"
> +echo "be stored in uEnv.txt on the boot partition. U-boot will read this=
"
> +echo "file on boot."
> +echo
> +
> +ipdefault=3D`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d:=
 -f2 | awk '{ print $1 }'`
> +platform=3D`grep PLATFORM=3D $cwd/../Rules.make | cut -d=3D -f2`
> +
> +
> +echo "Autodetected the following ip address of your host, correct it if =
necessary"
> +read -p "[ $ipdefault ] " ip
> +echo
> +
> +if [ ! -n "$ip" ]; then
> +    ip=3D$ipdefault
> +fi
> +
> +if [ -f $cwd/../.targetfs ]; then
> +    rootpath=3D`cat $cwd/../.targetfs`
> +else
> +    echo "Where is your target filesystem extracted?"
> +    read -p "[ ${HOME}/targetNFS ]" rootpath
> +
> +    if [ ! -n "$rootpath" ]; then
> +        rootpath=3D"${HOME}/targetNFS"
> +    fi
> +    echo
> +fi
> +
> +uimage=3D"uImage-""$platform"".bin"
> +uimagesrc=3D`ls -1 $cwd/../board-support/prebuilt-images/$uimage`
> +uimagedefault=3D`basename $uimagesrc`
> +
> +
> +echo "Select Linux kernel location:"
> +echo " 1: TFTP"
> +echo " 2: SD card"
> +echo
> +read -p "[ 1 ] " kernel
> +
> +if [ ! -n "$kernel" ]; then
> +    kernel=3D"1"
> +fi
> +
> +echo
> +echo "Select root file system location:"
> +echo " 1: NFS"
> +echo " 2: SD card"
> +echo
> +read -p "[ 1 ] " fs
> +
> +if [ ! -n "$fs" ]; then
> +    fs=3D"1"
> +fi
> +
> +
> +
> +if [ "$kernel" -eq "1" ]; then
> +    echo
> +    echo "Available kernel images in /tftproot:"
> +    for file in /tftpboot/*; do
> +	basefile=3D`basename $file`
> +	echo "    $basefile"
> +    done
> +    echo
> +    echo "Which kernel image do you want to boot from TFTP?"
> +    read -p "[ $uimagedefault ] " uimage
> +
> +    if [ ! -n "$uimage" ]; then
> +	uimage=3D$uimagedefault
> +    fi
> +fi
> +
> +isBB=3D"n"
> +isBBrevA3=3D"n"
> +configBB=3D"n"
> +
> +check_for_beaglebone() {
> +    # First check if there is a rev A3 board which uses the custom VID/P=
ID
> +    # combination
> +    lsusb -d 0403:a6d0 > /dev/null
> +
> +    if [ "$?" =3D "0" ]
> +    then
> +        # We found a beaglebone
> +        isBB=3D"y"
> +        isBBrevA3=3D"y"
> +        return
> +    fi
> +
> +    # Now let's check for a standard VID/PID like newer BeagleBones have
> +    sudo lsusb -vv -d 0403:6010 | grep "Product" | grep "BeagleBone" > /=
dev/null
> +
> +    if [ "$?" =3D "0" ]
> +    then
> +        isBB=3D"y"
> +        return
> +    fi
> +
> +    # Now let's check for EVM-SK
> +    sudo lsusb -vv -d 0403:6010 | grep "Product" | grep "EVM-SK" > /dev/=
null
> +
> +    if [ "$?" =3D "0" ]
> +    then
> +        isBB=3D"y"
> +        return
> +    fi
> +}
> +
> +check_for_beaglebone
> +
> +if [ "$isBB" =3D "y" ]
> +then
> +    echo ""
> +    echo ""
> +    echo "This SDK supports both the AM335x EVM and the BeagleBone/EVM-S=
K."
> +    echo "A BeagleBone/EVM-SK has been detected as attached to your host=
 system"
> +    echo "Are you wanting to configure u-boot for this device?  An"
> +    echo "answer of 'n' will configure u-boot for the AM335x EVM instead=
"
> +    read -p "(y/n) " configBB
> +fi
> +
> +if [ "$configBB" =3D "y" ]; then
> +#The BeagleBone has been detected, write information to uEnv.txt
> +
> +
> +	if [ "$kernel" -eq "1" ]; then
> +		 if [ "$fs" -eq "1" ]; then
> +			#TFTP and NFS Boot
> +			echo "serverip=3D$ip" > $cwd/uEnv.txt
> +			echo "rootpath=3D$rootpath" >> $cwd/uEnv.txt
> +			echo "bootfile=3D$uimage" >> $cwd/uEnv.txt
> +			echo "ip_method=3Ddhcp" >> $cwd/uEnv.txt
> +			echo "tftp_nfs_boot=3Decho Booting from network...; dhcp \${loadaddr}=
 \${bootfile}; run net_args; bootm \${loadaddr}" >> $cwd/uEnv.txt
> +			echo "uenvcmd=3Drun tftp_nfs_boot" >> $cwd/uEnv.txt
> +		    else
> +			#TFTP and SD Boot
> +			echo "serverip=3D$ip" > $cwd/uEnv.txt
> +			echo "bootfile=3D$uimage" >> $cwd/uEnv.txt
> +			echo "ip_method=3Dnone" >> $cwd/uEnv.txt
> +			echo "tftp_sd_boot=3Drun bootargs_defaults; dhcp \${loadaddr} \${boot=
file}; run mmc_args; bootm \${loadaddr}" >> $cwd/uEnv.txt
> +			echo "uenvcmd=3Drun tftp_sd_boot" >> $cwd/uEnv.txt
> +
> +		    fi
> +		else
> +		    if [ "$fs" -eq "1" ]; then
> +			#SD and NFS Boot
> +			echo "serverip=3D$ip" > $cwd/uEnv.txt
> +			echo "rootpath=3D$rootpath" >> $cwd/uEnv.txt
> +			echo "ip_method=3Ddhcp" >> $cwd/uEnv.txt
> +			echo "uenvcmd=3Dsetenv autoload no; mmc rescan 0; run mmc_load_uimage=
; run net_args; bootm \${kloadaddr}" >> $cwd/uEnv.txt
> +		    else
> +			#SD and SD boot
> +			echo "ip_method=3Dnone" > $cwd/uEnv.txt
> +			echo "uenvcmd=3Dmmc rescan 0; run mmc_boot" >> $cwd/uEnv.txt
> +		    fi
> +	fi
> +
> +
> +
> +	#Copy uEnv.txt to the mounted /media/boot partition
> +	if [ ! -d /media/boot ]; then
> +		echo "The boot partition doesn't appear to be mounted on the host."
> +		echo "If you're using a virtual machine, please ensure it has been imp=
orted to Linux"
> +		echo "Please ensure the boot partition is mounted and run setup.sh aga=
in."
> +		read -p "Press Enter to exit" pressEnter
> +		exit
> +	fi
> +
> +	echo "Copying uEnv.txt to boot partition..."
> +
> +	#Let's check to make sure it's /media/boot/ and not /media/boot_
> +	boots=3D`ls -1 /media/ | grep boot`
> +	if [ ! "$boots" =3D "boot" ]; then
> +		echo "There are multiple boot partions mounted in /media/."
> +		echo "Please unmount these partitions, reset the board, and run setup.=
sh again."
> +		read -p "Press Enter to exit" pressEnter
> +		exit
> +	fi
> +
> +	cp $cwd/uEnv.txt /media/boot/
> +	sync
> +	sync
> +
> +
> +
> +	ftdiInstalled=3D`lsmod | grep ftdi_sio`
> +	if [ -z "$ftdiInstalled" ]; then
> +	#Add the ability to regconize the BeagleBone as two serial ports
> +        if [ "$isBBrevA3" =3D "y" ]
> +        then
> +            echo "Finishing install by adding drivers for Beagle Bone...=
"
> +            sudo modprobe -q ftdi_sio vendor=3D0x0403 product=3D0xa6d0
> +
> +            #Create uDev rule
> +            echo "# Load ftdi_sio driver including support for XDS100v2.=
" > $cwd/99-custom.rules
> +            echo "SYSFS{idVendor}=3D=3D"0403", SYSFS{idProduct}=3D=3D"a6=
d0", \\" >>  $cwd/99-custom.rules
> +            echo "RUN+=3D\"/sbin/modprobe -q ftdi_sio vendor=3D0x0403 pr=
oduct=3D0xa6d0\"" >> $cwd/99-custom.rules
> +            sudo cp $cwd/99-custom.rules /etc/udev/rules.d/
> +            rm $cwd/99-custom.rules
> +        else
> +            sudo modprobe -q ftdi_sio
> +        fi
> +	fi
> +
> +	port=3D`dmesg | grep FTDI | grep "tty" | tail -1 | grep "attached" |  a=
wk '{ print $NF }'`
> +	while [ -z "$port" ]
> +	do
> +		sleep 1
> +		port=3D`dmesg  | grep FTDI | grep "tty" | tail -1 | grep "attached" | =
 awk '{ print $NF }'`
> +	done
> +
> +	#Change minicom to accurately reflect the bone
> +	minicomcfg=3D${HOME}/.minirc.dfl
> +	echo "pu port             /dev/$port
> +	pu baudrate         115200
> +	pu bits             8
> +	pu parity           N
> +	pu stopbits         1
> +	pu minit
> +	pu mreset
> +	pu mdialpre
> +	pu mdialsuf
> +	pu mdialpre2
> +	pu mdialsuf2
> +	pu mdialpre3
> +	pu mdialsuf3
> +	pu mconnect
> +	pu mnocon1          NO CARRIER
> +	pu mnocon2          BUSY
> +	pu mnocon3          NO DIALTONE
> +	pu mnocon4          VOICE
> +	pu rtscts           No" | tee $minicomcfg > /dev/null
> +	check_status
> +
> +	echo
> +	echo
> +	echo "-----------------------------------------------------------------=
---------------"
> +	echo "uEnv.text has been saved to the boot partition. uEnv.txt contains=
:"
> +	cat $cwd/uEnv.txt
> +	echo
> +	echo "On the next boot, the BeagleBone will boot with these settings."
> +	echo "Would you like to restart now (y/n)?"
> +	read -p "[ y ]" restartNow
> +
> +	if [ ! -n "$restartNow" ]; then
> +	  restartNow=3D"y"
> +	fi
> +
> +	if [ "$restartNow" =3D "y" ]; then
> +		echo "timeout 300" > $cwd/resetBoard.minicom
> +		echo "verbose on" >> $cwd/resetBoard.minicom
> +		echo "send \"\""  >> $cwd/resetBoard.minicom
> +		do_expect "\"am335x-evm login: \"" "send \"root\"" $cwd/resetBoard.min=
icom
> +		echo "send \"init 6\""  >> $cwd/resetBoard.minicom
> +		do_expect "\"Restarting system.\"" "! killall -s SIGHUP minicom" $cwd/=
resetBoard.minicom
> +	        # Change directory into cwd because minicom does not like . in =
the
> +	        # path to the script
> +	        cd $cwd
> +		minicom -w -S resetBoard.minicom
> +	        cd -
> +
> +	fi
> +
> +	echo "-----------------------------------------------------------------=
---------------"
> +	minicom -w
> +
> +else
> +#This is an AM335x EVM and thus has a NAND. Flash information to NAND.
> +
> +
> +	echo "timeout 300" > $cwd/setupBoard.minicom
> +	echo "verbose on" >> $cwd/setupBoard.minicom
> +	do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
> +	if [ "$kernel" -eq "1" ]; then
> +		if [ "$fs" -eq "1" ]; then
> +			#TFTP and NFS Boot
> +			do_expect "\"U-Boot#\"" "send \"setenv serverip $ip\"" $cwd/setupBoar=
d.minicom
> +			do_expect "\"U-Boot#\"" "send \"setenv rootpath $rootpath\"" $cwd/set=
upBoard.minicom
> +			do_expect "\"U-Boot#\"" "send \"setenv bootfile $uimage\"" $cwd/setup=
Board.minicom
> +			do_expect "\"U-Boot#\"" "send \"setenv ip_method dhcp\"" $cwd/setupBo=
ard.minicom
> +			do_expect "\"U-Boot#\"" "send \"setenv bootcmd 'setenv autoload no;dh=
cp \"\$\{bootfile\}\";tftp \"\$\{loadaddr\}\" \"\$\{bootfile\}\";run net_ar=
gs;bootm \"\$\{loadaddr\}\"'\"" $cwd/setupBoard.minicom
> +			do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
> +			do_expect "\"U-Boot#\"" "send \"boot\"" $cwd/setupBoard.minicom
> +		else
> +			#TFTP and SD Boot
> +			do_expect "\"U-Boot#\"" "send \"setenv serverip $ip\"" $cwd/setupBoar=
d.minicom
> +			do_expect "\"U-Boot#\"" "send \"setenv bootfile $uimage\"" $cwd/setup=
Board.minicom
> +			do_expect "\"U-Boot#\"" "send \"setenv ip_method none\"" $cwd/setupBo=
ard.minicom
> +			do_expect "\"U-Boot#\"" "send \"setenv bootcmd 'run bootargs_defaults=
; setenv autoload no; dhcp \"\$\{bootfile\}\"; tftp \"\$\{loadaddr\}\" \"\$=
\{bootfile\}\"; run mmc_args; bootm \"\$\{loadaddr\}\"'\"" $cwd/setupBoard.=
minicom
> +			do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
> +			do_expect "\"U-Boot#\"" "send \"boot\"" $cwd/setupBoard.minicom
> +		fi
> +	else
> +		if [ "$fs" -eq "1" ]; then
> +			#SD and NFS Boot
> +			do_expect "\"U-Boot#\"" "send \"setenv serverip $ip\"" $cwd/setupBoar=
d.minicom
> +			do_expect "\"U-Boot#\"" "send \"setenv rootpath $rootpath\"" $cwd/set=
upBoard.minicom
> +			do_expect "\"U-Boot#\"" "send \"setenv bootfile uImage\"" $cwd/setupB=
oard.minicom
> +			do_expect "\"U-Boot#\"" "send \"setenv ip_method dhcp\"" $cwd/setupBo=
ard.minicom
> +			do_expect "\"U-Boot#\"" "send \"setenv mmc_load_uimage 'mmc rescan; f=
atload mmc \"\$\{mmc_dev\}\" \"\$\{kloadaddr\}\" \"$\{bootfile\}\"'\"" $cwd=
/setupBoard.minicom
> +			do_expect "\"U-Boot#\"" "send \"setenv bootcmd 'setenv autoload no; r=
un mmc_load_uimage; run net_args; bootm \"\$\{kloadaddr\}\"'\"" $cwd/setupB=
oard.minicom
> +			do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
> +			do_expect "\"U-Boot#\"" "send \"boot\"" $cwd/setupBoard.minicom
> +		    else
> +			#SD and SD boot.
> +			do_expect "\"U-Boot#\"" "send \"setenv ip_method none\"" $cwd/setupBo=
ard.minicom
> +			do_expect "\"U-Boot#\"" "send \"setenv bootfile uImage\"" $cwd/setupB=
oard.minicom
> +			do_expect "\"U-Boot#\"" "send \"setenv bootcmd 'mmc rescan 0; run mmc=
_boot'\"" $cwd/setupBoard.minicom
> +			do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
> +			do_expect "\"U-Boot#\"" "send \"boot\"" $cwd/setupBoard.minicom
> +
> +		fi
> +	fi
> +	echo "! killall -s SIGHUP minicom" >> $cwd/setupBoard.minicom
> +
> +	echo "-----------------------------------------------------------------=
---------------"
> +	echo "Would you like to create a minicom script with the above paramete=
rs (y/n)?"
> +	read -p "[ y ] " minicom
> +	echo
> +
> +	if [ ! -n "$minicom" ]; then
> +	    minicom=3D"y"
> +	fi
> +
> +	if [ "$minicom" =3D "y" ]; then
> +
> +	    echo -n "Successfully wrote "
> +	    readlink -m $cwd/setupBoard.minicom
> +
> +	    echo "Would you like to run the setup script now (y/n)? This requir=
es you to connect"
> +	    echo "the RS-232 cable between your host and EVM as well as your et=
hernet cable as"
> +	    echo "described in the Quick Start Guide. Once answering 'y' on the=
 prompt below"
> +	    echo "you will have 300 seconds to connect the board and power cycl=
e it"
> +	    echo "before the setup times out"
> +	    echo
> +	    echo "After successfully executing this script, your EVM will be se=
t up. You will be "
> +	    echo "able to connect to it by executing 'minicom -w' or if you pre=
fer a windows host"
> +	    echo "you can set up Tera Term as explained in the Software Develop=
er's Guide."
> +	    echo "If you connect minicom or Tera Term and power cycle the board=
 Linux will boot."
> +	    echo
> +	    read -p "[ y ] " minicomsetup
> +
> +            if [ ! -n "$minicomsetup" ]; then
> +               minicomsetup=3D"y"
> +            fi
> +
> +            if [ "$minicomsetup" =3D "y" ]; then
> +              cd $cwd
> +	      minicom -w -S setupBoard.minicom
> +              cd -
> +	    fi
> +
> +            echo "You can manually run minicom in the future with this s=
etup script using: minicom -S $cwd/setupBoard.minicom"
> +            echo "------------------------------------------------------=
--------------------------"
> +
> +      fi
> +fi
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setu=
p/setup-uboot-env-am3517.sh b/meta-arago-distro/recipes-tisdk/ti-tisdk-setu=
p/ti-tisdk-setup/setup-uboot-env-am3517.sh
> new file mode 100644
> index 0000000..86c12e5
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup/setup=
-uboot-env-am3517.sh
> @@ -0,0 +1,266 @@
> +#!/bin/sh
> +
> +# This distribution contains contributions or derivatives under copyrigh=
t
> +# as follows:
> +#
> +# Copyright (c) 2010, Texas Instruments Incorporated
> +# All rights reserved.
> +#
> +# Redistribution and use in source and binary forms, with or without
> +# modification, are permitted provided that the following conditions
> +# are met:
> +# - Redistributions of source code must retain the above copyright notic=
e,
> +#   this list of conditions and the following disclaimer.
> +# - Redistributions in binary form must reproduce the above copyright
> +#   notice, this list of conditions and the following disclaimer in the
> +#   documentation and/or other materials provided with the distribution.
> +# - Neither the name of Texas Instruments nor the names of its
> +#   contributors may be used to endorse or promote products derived
> +#   from this software without specific prior written permission.
> +#
> +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
> +# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMI=
TED
> +# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTIC=
ULAR
> +# PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
> +# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
> +# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
> +# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
> +# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
> +# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING N=
EGLIGENCE
> +# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN=
 IF
> +# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> +
> +cwd=3D`dirname $0`
> +. $cwd/common.sh
> +
> +echo
> +echo "------------------------------------------------------------------=
--------------"
> +echo "This step will set up the u-boot variables for booting the EVM."
> +
> +ipdefault=3D`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d:=
 -f2 | awk '{ print $1 }'`
> +platform=3D`grep PLATFORM=3D $cwd/../Rules.make | cut -d=3D -f2`
> +prompt=3D"EVM #"
> +
> +echo "Autodetected the following ip address of your host, correct it if =
necessary"
> +read -p "[ $ipdefault ] " ip
> +echo
> +
> +if [ ! -n "$ip" ]; then
> +    ip=3D$ipdefault
> +fi
> +
> +if [ -f $cwd/../.targetfs ]; then
> +    rootpath=3D`cat $cwd/../.targetfs`
> +else
> +    echo "Where is your target filesystem extracted?"
> +    read -p "[ ${HOME}/targetNFS ]" rootpath
> +
> +    if [ ! -n "$rootpath" ]; then
> +        rootpath=3D"${HOME}/targetNFS"
> +    fi
> +    echo
> +fi
> +
> +uimage=3D"uImage-""$platform"".bin"
> +uimagesrc=3D`ls -1 $cwd/../board-support/prebuilt-images/$uimage`
> +uimagedefault=3D`basename $uimagesrc`
> +
> +baseargs=3D"console=3DttyO2,115200n8 rw noinitrd"
> +videoargs=3D""
> +fssdargs=3D"root=3D/dev/mmcblk0p2 rootfstype=3Dext3 rootwait"
> +fsnfsargs1=3D"root=3D/dev/nfs nfsroot=3D"
> +fsnfsargs2=3D"$ip:"
> +fsnfsargs3=3D"$rootpath"
> +fsnfsargs4=3D",nolock,rsize=3D1024,wsize=3D1024"
> +fsnfsargs=3D$fsnfsargs1$fsnfsargs2$fsnfsargs3$fsnfsargs4
> +
> +echo "Select Linux kernel location:"
> +echo " 1: TFTP"
> +echo " 2: SD card"
> +echo
> +read -p "[ 1 ] " kernel
> +
> +if [ ! -n "$kernel" ]; then
> +    kernel=3D"1"
> +fi
> +
> +echo
> +echo "Select root file system location:"
> +echo " 1: NFS"
> +echo " 2: SD card"
> +echo
> +read -p "[ 1 ] " fs
> +
> +if [ ! -n "$fs" ]; then
> +    fs=3D"1"
> +fi
> +
> +if [ "$kernel" -eq "1" ]; then
> +    echo
> +    echo "Available kernel images in /tftproot:"
> +    for file in /tftpboot/*; do
> +        basefile=3D`basename $file`
> +        echo "    $basefile"
> +    done
> +    echo
> +    echo "Which kernel image do you want to boot from TFTP?"
> +    read -p "[ $uimagedefault ] " uimage
> +
> +    if [ ! -n "$uimage" ]; then
> +        uimage=3D$uimagedefault
> +    fi
> +
> +    bootcmd=3D"setenv bootcmd 'dhcp;setenv serverip $ip;tftpboot;bootm'"
> +    serverip=3D"setenv serverip $ip"
> +    bootfile=3D"setenv bootfile $uimage"
> +
> +    if [ "$fs" -eq "1" ]; then
> +        bootargs=3D"setenv bootargs $baseargs $videoargs $fsnfsargs ip=
=3Ddhcp"
> +        cfg=3D"uimage-tftp_fs-nfs"
> +    else
> +        bootargs=3D"setenv bootargs $baseargs $videoargs $fssdargs ip=3D=
none"
> +        cfg=3D"uimage-tftp_fs-sd"
> +    fi
> +else
> +    if [ "$fs" -eq "1" ]; then
> +        bootargs=3D"setenv bootargs $baseargs $videoargs $fsnfsargs ip=
=3Ddhcp"
> +        bootcmd=3D"setenv bootcmd 'mmc rescan 0;fatload mmc 0 0x82000000=
 uImage;bootm 0x82000000'"
> +        cfg=3D"uimage-sd_fs-nfs"
> +    else
> +        bootargs=3D"setenv bootargs $baseargs $videoargs $fssdargs ip=3D=
none"
> +        bootcmd=3D"setenv bootcmd 'mmc rescan 0;fatload mmc 0 0x82000000=
 uImage;bootm 0x82000000'"
> +        cfg=3D"uimage-sd_fs-sd"
> +    fi
> +fi
> +
> +echo
> +echo "Resulting u-boot variable settings:"
> +echo
> +echo "setenv bootdelay 3"
> +echo "setenv baudrate 115200"
> +echo $bootargs
> +echo $bootcmd
> +
> +if [ -n "$serverip" ]; then
> +    echo "setenv autoload no"
> +    echo $serverip
> +fi
> +
> +if [ -n "$bootfile" ]; then
> +    echo $bootfile
> +fi
> +echo "------------------------------------------------------------------=
--------------"
> +
> +do_expect() {
> +    echo "expect {" >> $3
> +    check_status
> +    echo "    $1" >> $3
> +    check_status
> +    echo "}" >> $3
> +    check_status
> +    echo $2 >> $3
> +    check_status
> +    echo >> $3
> +}
> +
> +echo
> +echo "------------------------------------------------------------------=
--------------"
> +echo "Would you like to create a minicom script with the above parameter=
s (y/n)?"
> +read -p "[ y ] " minicom
> +echo
> +
> +if [ ! -n "$minicom" ]; then
> +    minicom=3D"y"
> +fi
> +
> +#Use =3D instead of =3D=3D for POSIX compliance and dash compatibility
> +if [ "$minicom" =3D "y" ]; then
> +    minicomfile=3Dsetup_$platform_$cfg.minicom
> +    minicomfilepath=3D$cwd/../$minicomfile
> +
> +    if [ -f $minicomfilepath ]; then
> +        echo "Moving existing $minicomfile to $minicomfile.old"
> +        mv $minicomfilepath $minicomfilepath.old
> +        check_status
> +    fi
> +
> +    timeout=3D300
> +    echo "timeout $timeout" >> $minicomfilepath
> +    echo "verbose on" >> $minicomfilepath
> +    echo >> $minicomfilepath
> +    do_expect "\"stop autoboot:\"" "send \"\"" $minicomfilepath
> +    do_expect "\"$prompt\"" "send \"setenv bootdelay 3\"" $minicomfilepa=
th
> +    do_expect "\"$prompt\"" "send \"setenv baudrate 115200\"" $minicomfi=
lepath
> +    do_expect "\"ENTER ...\"" "send \"\"" $minicomfilepath
> +    do_expect "\"$prompt\"" "send \"setenv oldbootargs \$\{bootargs\}\""=
 $minicomfilepath
> +
> +#   For dash compatibility need to use printf instead of echo
> +#   because dash shell will expand the \c by default
> +#   do_expect "\"$prompt\"" "send \"setenv bootargs $baseargs \c\"" $min=
icomfilepath
> +    echo "expect {" >> $minicomfilepath
> +    check_status
> +    echo "    \"$prompt\"" >> $minicomfilepath
> +    check_status
> +    echo "}" >> $minicomfilepath
> +    check_status
> +    printf "send \"setenv bootargs $baseargs \c\"\n" >> $minicomfilepath
> +    check_status
> +
> +#   For dash compatibility need to use printf instead of echo
> +    if [ "$fs" -eq "1" ]; then
> +        printf "send \"$fsnfsargs1\c\"\n" >> $minicomfilepath
> +        printf "send \"$fsnfsargs2\c\"\n" >> $minicomfilepath
> +        printf "send \"$fsnfsargs3\c\"\n" >> $minicomfilepath
> +        printf "send \"$fsnfsargs4 \c\"\n" >> $minicomfilepath
> +        echo "send \"ip=3Ddhcp\"" >> $minicomfilepath
> +    else
> +        printf "send \"$fssdargs \c\"\n" >> $minicomfilepath
> +        echo "send \"ip=3Doff\"" >> $minicomfilepath
> +    fi
> +    if [ "$kernel" -eq "1" ]; then
> +        do_expect "\"$prompt\"" "send \"setenv autoload no\"" $minicomfi=
lepath
> +        do_expect "\"$prompt\"" "send \"setenv oldserverip \$\{serverip\=
}\"" $minicomfilepath
> +        do_expect "\"$prompt\"" "send \"$serverip\"" $minicomfilepath
> +        do_expect "\"$prompt\"" "send \"setenv oldbootfile \$\{bootfile\=
}\"" $minicomfilepath
> +        do_expect "\"$prompt\"" "send \"$bootfile\"" $minicomfilepath
> +    fi
> +    do_expect "\"$prompt\"" "send \"setenv oldbootcmd \$\{bootcmd\}\"" $=
minicomfilepath
> +    do_expect "\"$prompt\"" "send \"$bootcmd\"" $minicomfilepath
> +    do_expect "\"$prompt\"" "send \"saveenv\"" $minicomfilepath
> +    do_expect "\"$prompt\"" "! killall -s SIGHUP minicom" $minicomfilepa=
th
> +
> +    echo -n "Successfully wrote "
> +    readlink -m $minicomfilepath
> +    echo
> +    echo "Would you like to run the setup script now (y/n)? This require=
s you to connect"
> +    echo "the RS-232 cable between your host and EVM as well as your eth=
ernet cable as"
> +    echo "described in the Quick Start Guide. Once answering 'y' on the =
prompt below"
> +    echo "you will have $timeout seconds to connect the board and power =
cycle it"
> +    echo "before the setup times out"
> +    echo
> +    echo "After successfully executing this script, your EVM will be set=
 up. You will be "
> +    echo "able to connect to it by executing 'minicom -w' or if you pref=
er a windows host"
> +    echo "you can set up Tera Term as explained in the Software Develope=
r's Guide."
> +    echo "If you connect minicom or Tera Term and power cycle the board =
Linux will boot."
> +    echo
> +    read -p "[ y ] " minicomsetup
> +
> +    if [ ! -n "$minicomsetup" ]; then
> +        minicomsetup=3D"y"
> +    fi
> +
> +    savedir=3D""
> +#Use =3D instead of =3D=3D for POSIX compliance and dash compatibility
> +    if [ "$minicomsetup" =3D "y" ]; then
> +#For dash compatibility, do not use pushd and popd
> +        savedir=3D$cwd
> +        cd "$cwd/.."
> +        check_status
> +        minicom -S $minicomfile
> +        cd $savedir
> +        check_status
> +    fi
> +
> +    echo "You can manually run minicom in the future with this setup scr=
ipt using: minicom -S $minicomfile"
> +fi
> +echo "------------------------------------------------------------------=
--------------"
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setu=
p/setup-uboot-env-am37x.sh b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup=
/ti-tisdk-setup/setup-uboot-env-am37x.sh
> new file mode 100644
> index 0000000..444b3f4
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup/setup=
-uboot-env-am37x.sh
> @@ -0,0 +1,268 @@
> +#!/bin/sh
> +
> +# This distribution contains contributions or derivatives under copyrigh=
t
> +# as follows:
> +#
> +# Copyright (c) 2010, Texas Instruments Incorporated
> +# All rights reserved.
> +#
> +# Redistribution and use in source and binary forms, with or without
> +# modification, are permitted provided that the following conditions
> +# are met:
> +# - Redistributions of source code must retain the above copyright notic=
e,
> +#   this list of conditions and the following disclaimer.
> +# - Redistributions in binary form must reproduce the above copyright
> +#   notice, this list of conditions and the following disclaimer in the
> +#   documentation and/or other materials provided with the distribution.
> +# - Neither the name of Texas Instruments nor the names of its
> +#   contributors may be used to endorse or promote products derived
> +#   from this software without specific prior written permission.
> +#
> +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
> +# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMI=
TED
> +# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTIC=
ULAR
> +# PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
> +# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
> +# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
> +# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
> +# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
> +# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING N=
EGLIGENCE
> +# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN=
 IF
> +# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> +
> +cwd=3D`dirname $0`
> +. $cwd/common.sh
> +
> +echo
> +echo "------------------------------------------------------------------=
--------------"
> +echo "This step will set up the u-boot variables for booting the EVM."
> +
> +ipdefault=3D`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d:=
 -f2 | awk '{ print $1 }'`
> +platform=3D`grep PLATFORM=3D $cwd/../Rules.make | cut -d=3D -f2`
> +prompt=3D"EVM #"
> +
> +echo "Autodetected the following ip address of your host, correct it if =
necessary"
> +read -p "[ $ipdefault ] " ip
> +echo
> +
> +if [ ! -n "$ip" ]; then
> +    ip=3D$ipdefault
> +fi
> +
> +if [ -f $cwd/../.targetfs ]; then
> +    rootpath=3D`cat $cwd/../.targetfs`
> +else
> +    echo "Where is your target filesystem extracted?"
> +    read -p "[ ${HOME}/targetNFS ]" rootpath
> +
> +    if [ ! -n "$rootpath" ]; then
> +        rootpath=3D"${HOME}/targetNFS"
> +    fi
> +    echo
> +fi
> +
> +uimage=3D"uImage-""$platform"".bin"
> +uimagesrc=3D`ls -1 $cwd/../board-support/prebuilt-images/$uimage`
> +uimagedefault=3D`basename $uimagesrc`
> +
> +baseargs=3D"console=3DttyO0,115200n8 rw noinitrd"
> +videoargs=3D"omap_vout.vid1_static_vrfb_alloc=3Dy"
> +fssdargs=3D"root=3D/dev/mmcblk0p2 rootfstype=3Dext3 rootwait"
> +fsnfsargs1=3D"root=3D/dev/nfs nfsroot=3D"
> +fsnfsargs2=3D"$ip:"
> +fsnfsargs3=3D"$rootpath"
> +fsnfsargs4=3D",nolock,rsize=3D1024,wsize=3D1024"
> +fsnfsargs=3D$fsnfsargs1$fsnfsargs2$fsnfsargs3$fsnfsargs4
> +
> +echo "Select Linux kernel location:"
> +echo " 1: TFTP"
> +echo " 2: SD card"
> +echo
> +read -p "[ 1 ] " kernel
> +
> +if [ ! -n "$kernel" ]; then
> +    kernel=3D"1"
> +fi
> +
> +echo
> +echo "Select root file system location:"
> +echo " 1: NFS"
> +echo " 2: SD card"
> +echo
> +read -p "[ 1 ] " fs
> +
> +if [ ! -n "$fs" ]; then
> +    fs=3D"1"
> +fi
> +
> +if [ "$kernel" -eq "1" ]; then
> +    echo
> +    echo "Available kernel images in /tftproot:"
> +    for file in /tftpboot/*; do
> +        basefile=3D`basename $file`
> +        echo "    $basefile"
> +    done
> +    echo
> +    echo "Which kernel image do you want to boot from TFTP?"
> +    read -p "[ $uimagedefault ] " uimage
> +
> +    if [ ! -n "$uimage" ]; then
> +        uimage=3D$uimagedefault
> +    fi
> +
> +    bootcmd=3D"setenv bootcmd 'dhcp;setenv serverip $ip;tftpboot;bootm'"
> +    serverip=3D"setenv serverip $ip"
> +    bootfile=3D"setenv bootfile $uimage"
> +
> +    if [ "$fs" -eq "1" ]; then
> +        bootargs=3D"setenv bootargs $baseargs $videoargs $fsnfsargs ip=
=3Ddhcp"
> +        cfg=3D"uimage-tftp_fs-nfs"
> +    else
> +        bootargs=3D"setenv bootargs $baseargs $videoargs $fssdargs ip=3D=
none"
> +        cfg=3D"uimage-tftp_fs-sd"
> +    fi
> +else
> +    if [ "$fs" -eq "1" ]; then
> +        bootargs=3D"setenv bootargs $baseargs $videoargs $fsnfsargs ip=
=3Ddhcp"
> +        bootcmd=3D"setenv bootcmd 'mmc rescan 0;fatload mmc 0 0x82000000=
 uImage;bootm 0x82000000'"
> +        cfg=3D"uimage-sd_fs-nfs"
> +    else
> +        bootargs=3D"setenv bootargs $baseargs $videoargs $fssdargs ip=3D=
none"
> +        bootcmd=3D"setenv bootcmd 'mmc rescan 0;fatload mmc 0 0x82000000=
 uImage;bootm 0x82000000'"
> +        cfg=3D"uimage-sd_fs-sd"
> +    fi
> +fi
> +
> +echo
> +echo "Resulting u-boot variable settings:"
> +echo
> +echo "setenv bootdelay 3"
> +echo "setenv baudrate 115200"
> +echo $bootargs
> +echo $bootcmd
> +
> +if [ -n "$serverip" ]; then
> +    echo "setenv autoload no"
> +    echo $serverip
> +fi
> +
> +if [ -n "$bootfile" ]; then
> +    echo $bootfile
> +fi
> +echo "------------------------------------------------------------------=
--------------"
> +
> +do_expect() {
> +    echo "expect {" >> $3
> +    check_status
> +    echo "    $1" >> $3
> +    check_status
> +    echo "}" >> $3
> +    check_status
> +    echo $2 >> $3
> +    check_status
> +    echo >> $3
> +}
> +
> +echo
> +echo "------------------------------------------------------------------=
--------------"
> +echo "Would you like to create a minicom script with the above parameter=
s (y/n)?"
> +read -p "[ y ] " minicom
> +echo
> +
> +if [ ! -n "$minicom" ]; then
> +    minicom=3D"y"
> +fi
> +
> +#Use =3D instead of =3D=3D for POSIX compliance and dash compatibility
> +if [ "$minicom" =3D "y" ]; then
> +    minicomfile=3Dsetup_$platform_$cfg.minicom
> +    minicomfilepath=3D$cwd/../$minicomfile
> +
> +    if [ -f $minicomfilepath ]; then
> +        echo "Moving existing $minicomfile to $minicomfile.old"
> +        mv $minicomfilepath $minicomfilepath.old
> +        check_status
> +    fi
> +
> +    timeout=3D300
> +    echo "timeout $timeout" >> $minicomfilepath
> +    echo "verbose on" >> $minicomfilepath
> +    echo >> $minicomfilepath
> +    do_expect "\"stop autoboot:\"" "send \"\"" $minicomfilepath
> +    do_expect "\"$prompt\"" "send \"setenv bootdelay 3\"" $minicomfilepa=
th
> +    do_expect "\"$prompt\"" "send \"setenv baudrate 115200\"" $minicomfi=
lepath
> +    do_expect "\"ENTER ...\"" "send \"\"" $minicomfilepath
> +    do_expect "\"$prompt\"" "send \"setenv oldbootargs \$\{bootargs\}\""=
 $minicomfilepath
> +
> +#   For dash compatibility need to use printf instead of echo
> +#   because dash shell will expand the \c by default
> +#   do_expect "\"$prompt\"" "send \"setenv bootargs $baseargs \c\"" $min=
icomfilepath
> +    echo "expect {" >> $minicomfilepath
> +    check_status
> +    echo "    \"$prompt\"" >> $minicomfilepath
> +    check_status
> +    echo "}" >> $minicomfilepath
> +    check_status
> +    printf "send \"setenv bootargs $baseargs \c\"\n" >> $minicomfilepath
> +    check_status
> +
> +#   For dash compatibility need to use printf instead of echo
> +    if [ "$fs" -eq "1" ]; then
> +        printf "send \"$fsnfsargs1\c\"\n" >> $minicomfilepath
> +        printf "send \"$fsnfsargs2\c\"\n" >> $minicomfilepath
> +        printf "send \"$fsnfsargs3\c\"\n" >> $minicomfilepath
> +        printf "send \"$fsnfsargs4 \c\"\n" >> $minicomfilepath
> +        printf "send \"$videoargs \c\"\n" >> $minicomfilepath
> +        echo "send \"ip=3Ddhcp\"" >> $minicomfilepath
> +    else
> +        printf "send \"$fssdargs \c\"\n" >> $minicomfilepath
> +        printf "send \"$videoargs \c\"\n" >> $minicomfilepath
> +        echo "send \"ip=3Doff\"" >> $minicomfilepath
> +    fi
> +    if [ "$kernel" -eq "1" ]; then
> +        do_expect "\"$prompt\"" "send \"setenv autoload no\"" $minicomfi=
lepath
> +        do_expect "\"$prompt\"" "send \"setenv oldserverip \$\{serverip\=
}\"" $minicomfilepath
> +        do_expect "\"$prompt\"" "send \"$serverip\"" $minicomfilepath
> +        do_expect "\"$prompt\"" "send \"setenv oldbootfile \$\{bootfile\=
}\"" $minicomfilepath
> +        do_expect "\"$prompt\"" "send \"$bootfile\"" $minicomfilepath
> +    fi
> +    do_expect "\"$prompt\"" "send \"setenv oldbootcmd \$\{bootcmd\}\"" $=
minicomfilepath
> +    do_expect "\"$prompt\"" "send \"$bootcmd\"" $minicomfilepath
> +    do_expect "\"$prompt\"" "send \"saveenv\"" $minicomfilepath
> +    do_expect "\"$prompt\"" "! killall -s SIGHUP minicom" $minicomfilepa=
th
> +
> +    echo -n "Successfully wrote "
> +    readlink -m $minicomfilepath
> +    echo
> +    echo "Would you like to run the setup script now (y/n)? This require=
s you to connect"
> +    echo "the RS-232 cable between your host and EVM as well as your eth=
ernet cable as"
> +    echo "described in the Quick Start Guide. Once answering 'y' on the =
prompt below"
> +    echo "you will have $timeout seconds to connect the board and power =
cycle it"
> +    echo "before the setup times out"
> +    echo
> +    echo "After successfully executing this script, your EVM will be set=
 up. You will be "
> +    echo "able to connect to it by executing 'minicom -w' or if you pref=
er a windows host"
> +    echo "you can set up Tera Term as explained in the Software Develope=
r's Guide."
> +    echo "If you connect minicom or Tera Term and power cycle the board =
Linux will boot."
> +    echo
> +    read -p "[ y ] " minicomsetup
> +
> +    if [ ! -n "$minicomsetup" ]; then
> +        minicomsetup=3D"y"
> +    fi
> +
> +    savedir=3D""
> +#Use =3D instead of =3D=3D for POSIX compliance and dash compatibility
> +    if [ "$minicomsetup" =3D "y" ]; then
> +#For dash compatibility, do not use pushd and popd
> +        savedir=3D$cwd
> +        cd "$cwd/.."
> +        check_status
> +        minicom -S $minicomfile
> +        cd $savedir
> +        check_status
> +    fi
> +
> +    echo "You can manually run minicom in the future with this setup scr=
ipt using: minicom -S $minicomfile"
> +fi
> +echo "------------------------------------------------------------------=
--------------"
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setu=
p/setup-uboot-env-beagleboard.sh b/meta-arago-distro/recipes-tisdk/ti-tisdk=
-setup/ti-tisdk-setup/setup-uboot-env-beagleboard.sh
> new file mode 100644
> index 0000000..8bed2e1
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup/setup=
-uboot-env-beagleboard.sh
> @@ -0,0 +1,268 @@
> +#!/bin/sh
> +
> +# This distribution contains contributions or derivatives under copyrigh=
t
> +# as follows:
> +#
> +# Copyright (c) 2010, Texas Instruments Incorporated
> +# All rights reserved.
> +#
> +# Redistribution and use in source and binary forms, with or without
> +# modification, are permitted provided that the following conditions
> +# are met:
> +# - Redistributions of source code must retain the above copyright notic=
e,
> +#   this list of conditions and the following disclaimer.
> +# - Redistributions in binary form must reproduce the above copyright
> +#   notice, this list of conditions and the following disclaimer in the
> +#   documentation and/or other materials provided with the distribution.
> +# - Neither the name of Texas Instruments nor the names of its
> +#   contributors may be used to endorse or promote products derived
> +#   from this software without specific prior written permission.
> +#
> +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
> +# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMI=
TED
> +# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTIC=
ULAR
> +# PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
> +# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
> +# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
> +# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
> +# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
> +# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING N=
EGLIGENCE
> +# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN=
 IF
> +# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> +
> +cwd=3D`dirname $0`
> +. $cwd/common.sh
> +
> +echo
> +echo "------------------------------------------------------------------=
--------------"
> +echo "This step will set up the u-boot variables for booting the EVM."
> +
> +ipdefault=3D`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d:=
 -f2 | awk '{ print $1 }'`
> +platform=3D`grep PLATFORM=3D $cwd/../Rules.make | cut -d=3D -f2`
> +prompt=3D"OMAP3 beagleboard.org #"
> +
> +echo "Autodetected the following ip address of your host, correct it if =
necessary"
> +read -p "[ $ipdefault ] " ip
> +echo
> +
> +if [ ! -n "$ip" ]; then
> +    ip=3D$ipdefault
> +fi
> +
> +if [ -f $cwd/../.targetfs ]; then
> +    rootpath=3D`cat $cwd/../.targetfs`
> +else
> +    echo "Where is your target filesystem extracted?"
> +    read -p "[ ${HOME}/targetNFS ]" rootpath
> +
> +    if [ ! -n "$rootpath" ]; then
> +        rootpath=3D"${HOME}/targetNFS"
> +    fi
> +    echo
> +fi
> +
> +uimage=3D"uImage-""$platform"".bin"
> +uimagesrc=3D`ls -1 $cwd/../board-support/prebuilt-images/$uimage`
> +uimagedefault=3D`basename $uimagesrc`
> +
> +baseargs=3D"console=3DttyO2,115200n8 rw noinitrd"
> +videoargs=3D"vram=3D12M omapfb.mode=3Ddvi:640x480MR-16@60 omapdss.def_di=
sp=3Ddvi"
> +fssdargs=3D"root=3D/dev/mmcblk0p2 rootfstype=3Dext3 rootwait"
> +fsnfsargs1=3D"root=3D/dev/nfs nfsroot=3D"
> +fsnfsargs2=3D"$ip:"
> +fsnfsargs3=3D"$rootpath"
> +fsnfsargs4=3D",nolock,rsize=3D1024,wsize=3D1024"
> +fsnfsargs=3D$fsnfsargs1$fsnfsargs2$fsnfsargs3$fsnfsargs4
> +
> +echo "Select Linux kernel location:"
> +echo " 1: TFTP"
> +echo " 2: SD card"
> +echo
> +read -p "[ 1 ] " kernel
> +
> +if [ ! -n "$kernel" ]; then
> +    kernel=3D"1"
> +fi
> +
> +echo
> +echo "Select root file system location:"
> +echo " 1: NFS"
> +echo " 2: SD card"
> +echo
> +read -p "[ 1 ] " fs
> +
> +if [ ! -n "$fs" ]; then
> +    fs=3D"1"
> +fi
> +
> +if [ "$kernel" -eq "1" ]; then
> +    echo
> +    echo "Available kernel images in /tftproot:"
> +    for file in /tftpboot/*; do
> +        basefile=3D`basename $file`
> +        echo "    $basefile"
> +    done
> +    echo
> +    echo "Which kernel image do you want to boot from TFTP?"
> +    read -p "[ $uimagedefault ] " uimage
> +
> +    if [ ! -n "$uimage" ]; then
> +        uimage=3D$uimagedefault
> +    fi
> +
> +    bootcmd=3D"setenv bootcmd 'dcache off;usb start;dhcp;setenv serverip=
 $ip;tftpboot;bootm'"
> +    serverip=3D"setenv serverip $ip"
> +    bootfile=3D"setenv bootfile $uimage"
> +
> +    if [ "$fs" -eq "1" ]; then
> +        bootargs=3D"setenv bootargs $baseargs $videoargs $fsnfsargs ip=
=3Ddhcp"
> +        cfg=3D"uimage-tftp_fs-nfs"
> +    else
> +        bootargs=3D"setenv bootargs $baseargs $videoargs $fssdargs ip=3D=
none"
> +        cfg=3D"uimage-tftp_fs-sd"
> +    fi
> +else
> +    if [ "$fs" -eq "1" ]; then
> +        bootargs=3D"setenv bootargs $baseargs $videoargs $fsnfsargs ip=
=3Ddhcp"
> +        bootcmd=3D"setenv bootcmd 'mmc rescan 0;fatload mmc 0 0x82000000=
 uImage;bootm 0x82000000'"
> +        cfg=3D"uimage-sd_fs-nfs"
> +    else
> +        bootargs=3D"setenv bootargs $baseargs $videoargs $fssdargs ip=3D=
none"
> +        bootcmd=3D"setenv bootcmd 'mmc rescan 0;fatload mmc 0 0x82000000=
 uImage;bootm 0x82000000'"
> +        cfg=3D"uimage-sd_fs-sd"
> +    fi
> +fi
> +
> +echo
> +echo "Resulting u-boot variable settings:"
> +echo
> +echo "setenv bootdelay 3"
> +echo "setenv baudrate 115200"
> +echo $bootargs
> +echo $bootcmd
> +
> +if [ -n "$serverip" ]; then
> +    echo "setenv autoload no"
> +    echo $serverip
> +fi
> +
> +if [ -n "$bootfile" ]; then
> +    echo $bootfile
> +fi
> +echo "------------------------------------------------------------------=
--------------"
> +
> +do_expect() {
> +    echo "expect {" >> $3
> +    check_status
> +    echo "    $1" >> $3
> +    check_status
> +    echo "}" >> $3
> +    check_status
> +    echo $2 >> $3
> +    check_status
> +    echo >> $3
> +}
> +
> +echo
> +echo "------------------------------------------------------------------=
--------------"
> +echo "Would you like to create a minicom script with the above parameter=
s (y/n)?"
> +read -p "[ y ] " minicom
> +echo
> +
> +if [ ! -n "$minicom" ]; then
> +    minicom=3D"y"
> +fi
> +
> +#Use =3D instead of =3D=3D for POSIX compliance and dash compatibility
> +if [ "$minicom" =3D "y" ]; then
> +    minicomfile=3Dsetup_$platform_$cfg.minicom
> +    minicomfilepath=3D$cwd/../$minicomfile
> +
> +    if [ -f $minicomfilepath ]; then
> +        echo "Moving existing $minicomfile to $minicomfile.old"
> +        mv $minicomfilepath $minicomfilepath.old
> +        check_status
> +    fi
> +
> +    timeout=3D300
> +    echo "timeout $timeout" >> $minicomfilepath
> +    echo "verbose on" >> $minicomfilepath
> +    echo >> $minicomfilepath
> +    do_expect "\"stop autoboot:\"" "send \"\"" $minicomfilepath
> +    do_expect "\"$prompt\"" "send \"setenv bootdelay 3\"" $minicomfilepa=
th
> +    do_expect "\"$prompt\"" "send \"setenv baudrate 115200\"" $minicomfi=
lepath
> +    do_expect "\"ENTER ...\"" "send \"\"" $minicomfilepath
> +    do_expect "\"$prompt\"" "send \"setenv oldbootargs \$\{bootargs\}\""=
 $minicomfilepath
> +
> +#   For dash compatibility need to use printf instead of echo
> +#   because dash shell will expand the \c by default
> +#   do_expect "\"$prompt\"" "send \"setenv bootargs $baseargs \c\"" $min=
icomfilepath
> +    echo "expect {" >> $minicomfilepath
> +    check_status
> +    echo "    \"$prompt\"" >> $minicomfilepath
> +    check_status
> +    echo "}" >> $minicomfilepath
> +    check_status
> +    printf "send \"setenv bootargs $baseargs \c\"\n" >> $minicomfilepath
> +    check_status
> +
> +#   For dash compatibility need to use printf instead of echo
> +    if [ "$fs" -eq "1" ]; then
> +        printf "send \"$fsnfsargs1\c\"\n" >> $minicomfilepath
> +        printf "send \"$fsnfsargs2\c\"\n" >> $minicomfilepath
> +        printf "send \"$fsnfsargs3\c\"\n" >> $minicomfilepath
> +        printf "send \"$fsnfsargs4 \c\"\n" >> $minicomfilepath
> +        printf "send \"$videoargs \c\"\n" >> $minicomfilepath
> +        echo "send \"ip=3Ddhcp\"" >> $minicomfilepath
> +    else
> +        printf "send \"$fssdargs \c\"\n" >> $minicomfilepath
> +        printf "send \"$videoargs \c\"\n" >> $minicomfilepath
> +        echo "send \"ip=3Doff\"" >> $minicomfilepath
> +    fi
> +    if [ "$kernel" -eq "1" ]; then
> +        do_expect "\"$prompt\"" "send \"setenv autoload no\"" $minicomfi=
lepath
> +        do_expect "\"$prompt\"" "send \"setenv oldserverip \$\{serverip\=
}\"" $minicomfilepath
> +        do_expect "\"$prompt\"" "send \"$serverip\"" $minicomfilepath
> +        do_expect "\"$prompt\"" "send \"setenv oldbootfile \$\{bootfile\=
}\"" $minicomfilepath
> +        do_expect "\"$prompt\"" "send \"$bootfile\"" $minicomfilepath
> +    fi
> +    do_expect "\"$prompt\"" "send \"setenv oldbootcmd \$\{bootcmd\}\"" $=
minicomfilepath
> +    do_expect "\"$prompt\"" "send \"$bootcmd\"" $minicomfilepath
> +    do_expect "\"$prompt\"" "send \"saveenv\"" $minicomfilepath
> +    do_expect "\"$prompt\"" "! killall -s SIGHUP minicom" $minicomfilepa=
th
> +
> +    echo -n "Successfully wrote "
> +    readlink -m $minicomfilepath
> +    echo
> +    echo "Would you like to run the setup script now (y/n)? This require=
s you to connect"
> +    echo "the RS-232 cable between your host and EVM as well as your eth=
ernet cable as"
> +    echo "described in the Quick Start Guide. Once answering 'y' on the =
prompt below"
> +    echo "you will have $timeout seconds to connect the board and power =
cycle it"
> +    echo "before the setup times out"
> +    echo
> +    echo "After successfully executing this script, your EVM will be set=
 up. You will be "
> +    echo "able to connect to it by executing 'minicom -w' or if you pref=
er a windows host"
> +    echo "you can set up Tera Term as explained in the Software Develope=
r's Guide."
> +    echo "If you connect minicom or Tera Term and power cycle the board =
Linux will boot."
> +    echo
> +    read -p "[ y ] " minicomsetup
> +
> +    if [ ! -n "$minicomsetup" ]; then
> +        minicomsetup=3D"y"
> +    fi
> +
> +    savedir=3D""
> +#Use =3D instead of =3D=3D for POSIX compliance and dash compatibility
> +    if [ "$minicomsetup" =3D "y" ]; then
> +#For dash compatibility, do not use pushd and popd
> +        savedir=3D$cwd
> +        cd "$cwd/.."
> +        check_status
> +        minicom -S $minicomfile
> +        cd $savedir
> +        check_status
> +    fi
> +
> +    echo "You can manually run minicom in the future with this setup scr=
ipt using: minicom -S $minicomfile"
> +fi
> +echo "------------------------------------------------------------------=
--------------"
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setu=
p/setup.sh b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup/=
setup.sh
> new file mode 100644
> index 0000000..dec292f
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup/setup=
.sh
> @@ -0,0 +1,65 @@
> +#!/bin/sh
> +
> +# This distribution contains contributions or derivatives under copyrigh=
t
> +# as follows:
> +#
> +# Copyright (c) 2010, Texas Instruments Incorporated
> +# All rights reserved.
> +#
> +# Redistribution and use in source and binary forms, with or without
> +# modification, are permitted provided that the following conditions
> +# are met:
> +# - Redistributions of source code must retain the above copyright notic=
e,
> +#   this list of conditions and the following disclaimer.
> +# - Redistributions in binary form must reproduce the above copyright
> +#   notice, this list of conditions and the following disclaimer in the
> +#   documentation and/or other materials provided with the distribution.
> +# - Neither the name of Texas Instruments nor the names of its
> +#   contributors may be used to endorse or promote products derived
> +#   from this software without specific prior written permission.
> +#
> +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
> +# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMI=
TED
> +# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTIC=
ULAR
> +# PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
> +# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
> +# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
> +# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
> +# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
> +# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING N=
EGLIGENCE
> +# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN=
 IF
> +# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> +
> +echo
> +echo "------------------------------------------------------------------=
--------------"
> +echo "TISDK setup script"
> +echo
> +echo "This script will set up your development host for SDK development.=
"
> +echo "Parts of this script require administrator priviliges (sudo access=
)."
> +echo "------------------------------------------------------------------=
--------------"
> +
> +cwd=3D`dirname $0`
> +. $cwd/bin/common.sh
> +
> +$cwd/bin/setup-host-check.sh
> +check_status
> +
> +$cwd/bin/setup-package-install.sh
> +check_status
> +
> +$cwd/bin/setup-targetfs-nfs.sh
> +check_status
> +
> +$cwd/bin/setup-tftp.sh
> +check_status
> +
> +$cwd/bin/setup-minicom.sh
> +check_status
> +
> +$cwd/bin/setup-uboot-env.sh
> +check_status
> +
> +echo
> +echo "TISDK setup completed!"
> +echo "Please continue reading the Software Developer's Guide for more in=
formation on"
> +echo "how to develop software on the EVM"
> --=20
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>=20
_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

