Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 3B5B552A5E
	for <meta-arago@arago-project.org>;
	Wed,  7 Aug 2013 16:51:47 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r77Gpk3a006081
	for <meta-arago@arago-project.org>; Wed, 7 Aug 2013 11:51:46 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r77Gpkn0022118
	for <meta-arago@arago-project.org>; Wed, 7 Aug 2013 11:51:46 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Wed, 7 Aug 2013 11:51:46 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Thread-Topic: [meta-arago] [PATCH v2] ti-tisdk-install: Move SDK
	installation	script
Thread-Index: AQHOktus0bWDqTcv+Ey+FohmNwGiyJmJOHTwgAD2LICAABtjAA==
Date: Wed, 7 Aug 2013 16:51:45 +0000
Message-ID: <47BA6E90-EEA0-4DBC-9BF0-060BEB17C15A@ti.com>
References: <1375819133-1835-1-git-send-email-fcooper@ti.com>
	<7D46E86EC0A8354091174257B2FED101596963C9@DLEE11.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C5164AF@DFLE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C5164AF@DFLE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH v2] ti-tisdk-install: Move SDK installation	script
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
X-List-Received-Date: Wed, 07 Aug 2013 16:51:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BCFDDBC3097D8841A6983A4A0CE23BFA@owa.mail.ti.com>
Content-Transfer-Encoding: quoted-printable

I meant the MIT license header to the script. Since this is something the c=
ustomer will likely see I thought that might help avoid confusion=20
On Aug 7, 2013, at 8:40 PM, "Cooper Jr., Franklin" <fcooper@ti.com> wrote:

> The script wasn't doing anything special or clever so I figured I stick w=
ith a simply MIT license. Are you asking to add that license or a similar B=
SD license to the script anyway or do you want the Copyright version I init=
ially had?
>=20
>> -----Original Message-----
>> From: Maupin, Chase
>> Sent: Wednesday, August 07, 2013 12:30 AM
>> To: Cooper Jr., Franklin; meta-arago@arago-project.org
>> Subject: RE: [meta-arago] [PATCH v2] ti-tisdk-install: Move SDK installa=
tion
>> script
>>=20
>> Any issue with putting the license text in the shell script header?
>>=20
>>=20
>>> -----Original Message-----
>>> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>>> bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>>> Sent: Wednesday, August 07, 2013 1:29 AM
>>> To: meta-arago@arago-project.org
>>> Cc: Cooper Jr., Franklin
>>> Subject: [meta-arago] [PATCH v2] ti-tisdk-install: Move SDK
>>> installation script
>>>=20
>>> Several steps are required before an SDK image is ready to be used.
>>> 1. Extract toolchain sdk (linuxdevkit.sh) 2. Update Rules.make
>>> variables.
>>> 3. Update CCS project information
>>>=20
>>> The script that sdk-install.sh is based on was previously packaged and
>>> ran by the SDK installed (based on InstallJammer).
>>>=20
>>> By moving the logic outside of the installer. OE users can now create a
>>> fully functioning SDK without any outside dependencies by simply
>>> running sdk-install located in the root of the SDK image.
>>>=20
>>> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>>> ---
>>> Version 2 changes:
>>> Remove debug mode (set -x)
>>> Remove license since script is simple
>>>=20
>>> .../ti-tisdk-install/sdk-install.sh                |   85
>>> ++++++++++++++++++++
>>> .../ti-tisdk-install/ti-tisdk-install_1.0.bb       |   15 ++++
>>> 2 files changed, 100 insertions(+), 0 deletions(-)  create mode 100644
>>> meta-arago-distro/recipes-tisdk/ti-tisdk-
>>> install/ti-tisdk-install/sdk-install.sh
>>> create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-
>>> install/ti-tisdk-install_1.0.bb
>>>=20
>>> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-install/ti-
>>> tisdk-install/sdk-install.sh b/meta-arago-distro/recipes-tisdk/ti-
>>> tisdk-install/ti-tisdk-install/sdk-install.sh
>>> new file mode 100644
>>> index 0000000..a7cd1a7
>>> --- /dev/null
>>> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-install/ti-tisdk-
>>> install/sdk-install.sh
>>> @@ -0,0 +1,85 @@
>>> +
>>> +#!/bin/sh
>>> +
>>> +# Process command line...
>>> +while [ $# -gt 0 ]; do
>>> +  case $1 in
>>> +    --install_dir)
>>> +      shift;
>>> +      install_dir=3D$1;
>>> +      ;;
>>> +     *)
>>> +      shift;
>>> +      ;;
>>> +  esac
>>> +done
>>> +
>>> +if [ "x$install_dir" =3D "x" ]; then
>>> +    # Verify that the script is being called within untar SDK
>>> directory
>>> +    if [ ! -d "$PWD/board-support" -a ! -f "$PWD/Rules.make" ];
>>> then
>>> +        echo "Script must be called within untarred sdk
>>> directory"
>>> +        exit 1
>>> +    else
>>> +        install_dir=3D"$PWD"
>>> +    fi
>>> +fi
>>> +
>>> +# Get full path to SDK directory
>>> +cd "$install_dir"
>>> +install_dir=3D"$PWD"
>>> +cd -
>>> +
>>> +if [ ! -d $install_dir ]; then
>>> +    echo "Installation directory does not exist"
>>> +    exit 1
>>> +fi
>>> +
>>> +# Remove any .svn directories that were packaged by the
>>> sourceipks
>>> +rm -rf `find $install_dir -name ".svn"`
>>> +
>>> +
>>> +# Update Rules.make variables
>>> +
>>> +sed -i -e s=3D__SDK__INSTALL_DIR__=3D$install_dir=3D
>>> $install_dir/Rules.make
>>> +
>>> +# Find the linux directory name
>>> +linux=3D`find $install_dir/board-support -maxdepth 1 -name
>>> "linux*"`
>>> +linux=3D`basename $linux`
>>> +sed -i -e s=3D__KERNEL_NAME__=3D$linux=3D $install_dir/Rules.make cd -
>>> +
>>> +
>>> +# Install toolchain sdk
>>> +$install_dir/linux-devkit.sh -y -d $install_dir/linux-devkit
>>> +
>>> +# Remove toolchain sdk
>>> +rm $install_dir/linux-devkit.sh
>>> +
>>> +
>>> +# Update example applications CCS project files
>>> +
>>> +# Grab some essential variables from environment-setup TARGET_SYS=3D`s=
ed
>>> +-n 's/^export TARGET_SYS=3D//p' $install_dir/linux-
>>> devkit/environment-setup`
>>> +TOOLCHAIN_SYS=3D`sed -n 's/^export TOOLCHAIN_SYS=3D//p'
>>> $install_dir/linux-devkit/environment-setup`
>>> +SDK_SYS=3D`sed -n 's/^export SDK_SYS=3D//p' $install_dir/linux-
>>> devkit/environment-setup`
>>> +
>>> +# Grab toolchain's GCC version
>>> +GCC_VERSION=3D`ls $install_dir/linux-
>>> devkit/sysroots/$SDK_SYS/usr/lib/gcc/$TOOLCHAIN_SYS/`
>>> +
>>> +TOOLCHAIN_TARGET_INCLUDE_DIR=3D"linux-
>>> devkit/sysroots/$TARGET_SYS/usr/include"
>>> +TOOLCHAIN_INCLUDE_DIR=3D"linux-
>>> devkit/sysroots/$SDK_SYS/usr/lib/gcc/$TOOLCHAIN_SYS/$GCC_VERSION/i
>>> nclude"
>>> +
>>> +# Update CCS project files using important paths to headers
>>> +
>>> +find $install_dir/example-applications -type f -exec sed -i
>>> "s|<TOOLCHAIN_TARGET_INCLUDE_DIR>|$TOOLCHAIN_TARGET_INCLUDE_
>> DIR|g"
>>> {} \;
>>> +find $install_dir/example-applications -type f -exec sed -i
>>> "s|<TOOLCHAIN_INCLUDE_DIR>|$TOOLCHAIN_INCLUDE_DIR|g" {} \;
>>> +
>>> +
>>> +if [ -f "$install_dir/sdk-install.sh" ]; then
>>> +    # File is only able to run once so delete it from the SDK
>>> +    rm "$install_dir/sdk-install.sh"
>>> +fi
>>> +
>>> +echo "Installation completed!"
>>> +exit 0
>>> +
>>> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-install/ti-
>>> tisdk-install_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-
>>> install/ti-tisdk-install_1.0.bb
>>> new file mode 100644
>>> index 0000000..1c96ae5
>>> --- /dev/null
>>> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-install/ti-tisdk-
>>> install_1.0.bb
>>> @@ -0,0 +1,15 @@
>>> +DESCRIPTION =3D "Contains script to properly extract and update
>>> various files"
>>> +LICENSE =3D "MIT"
>>> +LIC_FILES_CHKSUM =3D
>>> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4
>>> de20420"
>>> +
>>> +SRC_URI =3D "file://sdk-install.sh"
>>> +
>>> +PR =3D "r0"
>>> +
>>> +do_install () {
>>> +    install -d ${D}/
>>> +    install  ${WORKDIR}/sdk-install.sh ${D}/sdk-install.sh
>>> +
>>> +}
>>> +
>>> +FILES_${PN} =3D "/*"
>>> --
>>> 1.7.0.4
>>>=20
>>> _______________________________________________
>>> meta-arago mailing list
>>> meta-arago@arago-project.org
>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

