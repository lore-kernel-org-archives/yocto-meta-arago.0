Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 0F1705298F
	for <meta-arago@arago-project.org>;
	Mon,  9 Sep 2013 16:45:22 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r89GjLAC003833
	for <meta-arago@arago-project.org>; Mon, 9 Sep 2013 11:45:21 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r89GjKiL003056
	for <meta-arago@arago-project.org>; Mon, 9 Sep 2013 11:45:20 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Mon, 9 Sep 2013 11:45:20 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH v4] ti-tisdk-install: Move SDK
	installation script
Thread-Index: AQHOnrSiUcNDdMfO5EOtfywnde/ApZmiDcSA//+wB5CAG/w8UA==
Date: Mon, 9 Sep 2013 16:45:20 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C54B8D4@DFLE08.ent.ti.com>
References: <1377122084-1745-1-git-send-email-fcooper@ti.com>
	<20130822210759.GJ25749@edge>
	<8F29D6B095ED194EA1980491A5E029710C52A2B3@DFLE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C52A2B3@DFLE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH v4] ti-tisdk-install: Move SDK installation script
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
X-List-Received-Date: Mon, 09 Sep 2013 16:45:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ping


> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> Sent: Thursday, August 22, 2013 4:25 PM
> To: Dmytriyenko, Denys
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH v4] ti-tisdk-install: Move SDK installat=
ion
> script
>=20
>=20
>=20
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Thursday, August 22, 2013 4:08 PM
> > To: Cooper Jr., Franklin
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH v4] ti-tisdk-install: Move SDK
> > installation script
> >
> > So, any specific reason for the name ti-tisdk-install?
> >
> > .../recipes-tisdk/ti-tisdk-install/ti-tisdk-install/sdk-install.sh
> >
> > There's too many "ti"s in there... Would you be Ok with a shorter
> > name, such as tisdk-install? I can even make the name change for you,
> > so you won't need to re- spin a v5 of the patch, if you don't object...
> [Franklin]
> I have no issue.
> >
> > --
> > Denys
> >
> >
> > On Wed, Aug 21, 2013 at 04:54:44PM -0500, Franklin S. Cooper Jr wrote:
> > > Several steps are required before an SDK image is ready to be used.
> > > 1. Extract toolchain sdk (linuxdevkit.sh) 2. Update Rules.make
> > > variables.
> > > 3. Update CCS project information
> > >
> > > The script that sdk-install.sh is based on was previously packaged
> > > and ran by the SDK installed (based on InstallJammer).
> > >
> > > By moving the logic outside of the installer. OE users can now
> > > create a fully functioning SDK without any outside dependencies by
> > > simply running sdk-install located in the root of the SDK image.
> > >
> > > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > > ---
> > > Version 4 changes:
> > > Includes correct license checksum that wasn't comitted when patch
> > > was
> > created..
> > >
> > > Version 3 changes:
> > > Included MIT license in script.
> > >
> > > Version 2 changes:
> > > Remove debug mode (set -x)
> > > Remove license since script is simple
> > >
> > >  .../ti-tisdk-install/sdk-install.sh                |  102 ++++++++++=
++++++++++
> > >  .../ti-tisdk-install/ti-tisdk-install_1.0.bb       |   15 +++
> > >  2 files changed, 117 insertions(+), 0 deletions(-)  create mode
> > > 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-install/ti-tisdk-
> > install/sdk-install.sh
> > >  create mode 100644
> > > meta-arago-distro/recipes-tisdk/ti-tisdk-install/ti-tisdk-
> > install_1.0.bb
> > >
> > > diff --git
> > > a/meta-arago-distro/recipes-tisdk/ti-tisdk-install/ti-tisdk-install/
> > > sdk-
> > install.sh
> > b/meta-arago-distro/recipes-tisdk/ti-tisdk-install/ti-tisdk-install/sd
> > k-
> > install.sh
> > > new file mode 100644
> > > index 0000000..b19b65f
> > > --- /dev/null
> > > +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-install/ti-tisdk-inst
> > > +++ all/sdk-
> > install.sh
> > > @@ -0,0 +1,102 @@
> > > +#!/bin/sh
> > > +
> > > +# Permission is hereby granted, free of charge, to any person
> > > +obtaining a
> > copy
> > > +# of this software and associated documentation files (the
> > > +"Software"), to
> > deal
> > > +# in the Software without restriction, including without limitation
> > > +the rights # to use, copy, modify, merge, publish, distribute,
> > > +sublicense, and/or sell # copies of the Software, and to permit
> > > +persons to whom the Software is # furnished to do so, subject to the
> following conditions:
> > > +#
> > > +# The above copyright notice and this permission notice shall be
> > > +included in # all copies or substantial portions of the Software.
> > > +#
> > > +# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
> KIND,
> > EXPRESS OR
> > > +# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> > MERCHANTABILITY,
> > > +# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
> > EVENT SHALL THE
> > > +# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
> DAMAGES
> > OR OTHER
> > > +# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> OTHERWISE,
> > ARISING FROM,
> > > +# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> OTHER
> > DEALINGS IN
> > > +# THE SOFTWARE.
> > > +
> > > +# Process command line...
> > > +while [ $# -gt 0 ]; do
> > > +  case $1 in
> > > +    --install_dir)
> > > +      shift;
> > > +      install_dir=3D$1;
> > > +      ;;
> > > +     *)
> > > +      shift;
> > > +      ;;
> > > +  esac
> > > +done
> > > +
> > > +if [ "x$install_dir" =3D "x" ]; then
> > > +    # Verify that the script is being called within untar SDK direct=
ory
> > > +    if [ ! -d "$PWD/board-support" -a ! -f "$PWD/Rules.make" ]; then
> > > +        echo "Script must be called within untarred sdk directory"
> > > +        exit 1
> > > +    else
> > > +        install_dir=3D"$PWD"
> > > +    fi
> > > +fi
> > > +
> > > +# Get full path to SDK directory
> > > +cd "$install_dir"
> > > +install_dir=3D"$PWD"
> > > +cd -
> > > +
> > > +if [ ! -d $install_dir ]; then
> > > +	echo "Installation directory does not exist"
> > > +	exit 1
> > > +fi
> > > +
> > > +# Remove any .svn directories that were packaged by the sourceipks
> > > +rm -rf `find $install_dir -name ".svn"`
> > > +
> > > +
> > > +# Update Rules.make variables
> > > +
> > > +sed -i -e s=3D__SDK__INSTALL_DIR__=3D$install_dir=3D
> > > +$install_dir/Rules.make
> > > +
> > > +# Find the linux directory name
> > > +linux=3D`find $install_dir/board-support -maxdepth 1 -name "linux*"`
> > > +linux=3D`basename $linux` sed -i -e s=3D__KERNEL_NAME__=3D$linux=3D
> > > +$install_dir/Rules.make cd -
> > > +
> > > +
> > > +# Install toolchain sdk
> > > +$install_dir/linux-devkit.sh -y -d $install_dir/linux-devkit
> > > +
> > > +# Remove toolchain sdk
> > > +rm $install_dir/linux-devkit.sh
> > > +
> > > +
> > > +# Update example applications CCS project files
> > > +
> > > +# Grab some essential variables from environment-setup
> > > +TARGET_SYS=3D`sed -n 's/^export TARGET_SYS=3D//p' $install_dir/linux=
-
> > devkit/environment-setup`
> > > +TOOLCHAIN_SYS=3D`sed -n 's/^export TOOLCHAIN_SYS=3D//p'
> > > +$install_dir/linux-
> > devkit/environment-setup`
> > > +SDK_SYS=3D`sed -n 's/^export SDK_SYS=3D//p' $install_dir/linux-
> > devkit/environment-setup`
> > > +
> > > +# Grab toolchain's GCC version
> > > +GCC_VERSION=3D`ls $install_dir/linux-
> > devkit/sysroots/$SDK_SYS/usr/lib/gcc/$TOOLCHAIN_SYS/`
> > > +
> > > +TOOLCHAIN_TARGET_INCLUDE_DIR=3D"linux-
> > devkit/sysroots/$TARGET_SYS/usr/include"
> > > +TOOLCHAIN_INCLUDE_DIR=3D"linux-
> >
> devkit/sysroots/$SDK_SYS/usr/lib/gcc/$TOOLCHAIN_SYS/$GCC_VERSION/inclu
> > de"
> > > +
> > > +# Update CCS project files using important paths to headers
> > > +
> > > +find $install_dir/example-applications -type f -exec sed -i
> >
> "s|<TOOLCHAIN_TARGET_INCLUDE_DIR>|$TOOLCHAIN_TARGET_INCLUDE_DI
> > R|g" {} \;
> > > +find $install_dir/example-applications -type f -exec sed -i
> > "s|<TOOLCHAIN_INCLUDE_DIR>|$TOOLCHAIN_INCLUDE_DIR|g" {} \;
> > > +
> > > +
> > > +if [ -f "$install_dir/sdk-install.sh" ]; then
> > > +	# File is only able to run once so delete it from the SDK
> > > +	rm "$install_dir/sdk-install.sh"
> > > +fi
> > > +
> > > +echo "Installation completed!"
> > > +exit 0
> > > +
> > > diff --git
> > > a/meta-arago-distro/recipes-tisdk/ti-tisdk-install/ti-tisdk-
> > install_1.0.bb
> > b/meta-arago-distro/recipes-tisdk/ti-tisdk-install/ti-tisdk-
> > install_1.0.bb
> > > new file mode 100644
> > > index 0000000..26a6966
> > > --- /dev/null
> > > +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-install/ti-tisdk-inst
> > > +++ all_1.0.bb
> > > @@ -0,0 +1,15 @@
> > > +DESCRIPTION =3D "Contains script to properly extract and update vari=
ous
> files"
> > > +LICENSE =3D "MIT"
> > > +LIC_FILES_CHKSUM =3D "file://../sdk-
> >
> install.sh;beginline=3D3;endline=3D19;md5=3D4b89903784b8d154cd8b631388da4=
f0
> > d"
> > > +
> > > +SRC_URI =3D "file://sdk-install.sh"
> > > +
> > > +PR =3D "r0"
> > > +
> > > +do_install () {
> > > +    install -d ${D}/
> > > +    install  ${WORKDIR}/sdk-install.sh ${D}/sdk-install.sh
> > > +
> > > +}
> > > +
> > > +FILES_${PN} =3D "/*"
> > > --
> > > 1.7.0.4
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

