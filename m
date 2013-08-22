Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 31A5B52A93
	for <meta-arago@arago-project.org>;
	Thu, 22 Aug 2013 21:08:01 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7ML80e9012618
	for <meta-arago@arago-project.org>; Thu, 22 Aug 2013 16:08:00 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7ML806l022023
	for <meta-arago@arago-project.org>; Thu, 22 Aug 2013 16:08:00 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 22 Aug 2013 16:08:00 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7ML802D009665;
	Thu, 22 Aug 2013 16:08:00 -0500
Date: Thu, 22 Aug 2013 17:07:59 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20130822210759.GJ25749@edge>
References: <1377122084-1745-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1377122084-1745-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
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
X-List-Received-Date: Thu, 22 Aug 2013 21:08:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

So, any specific reason for the name ti-tisdk-install?

.../recipes-tisdk/ti-tisdk-install/ti-tisdk-install/sdk-install.sh

There's too many "ti"s in there... Would you be Ok with a shorter name, such 
as tisdk-install? I can even make the name change for you, so you won't need 
to re-spin a v5 of the patch, if you don't object...

-- 
Denys


On Wed, Aug 21, 2013 at 04:54:44PM -0500, Franklin S. Cooper Jr wrote:
> Several steps are required before an SDK image is ready to be used.
> 1. Extract toolchain sdk (linuxdevkit.sh)
> 2. Update Rules.make variables.
> 3. Update CCS project information
> 
> The script that sdk-install.sh is based on was previously packaged and ran by
> the SDK installed (based on InstallJammer).
> 
> By moving the logic outside of the installer. OE users can now create
> a fully functioning SDK without any outside dependencies by simply running
> sdk-install located in the root of the SDK image.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
> Version 4 changes:
> Includes correct license checksum that wasn't comitted when patch was created..
> 
> Version 3 changes:
> Included MIT license in script.
> 
> Version 2 changes:
> Remove debug mode (set -x)
> Remove license since script is simple
> 
>  .../ti-tisdk-install/sdk-install.sh                |  102 ++++++++++++++++++++
>  .../ti-tisdk-install/ti-tisdk-install_1.0.bb       |   15 +++
>  2 files changed, 117 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-install/ti-tisdk-install/sdk-install.sh
>  create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-install/ti-tisdk-install_1.0.bb
> 
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-install/ti-tisdk-install/sdk-install.sh b/meta-arago-distro/recipes-tisdk/ti-tisdk-install/ti-tisdk-install/sdk-install.sh
> new file mode 100644
> index 0000000..b19b65f
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-install/ti-tisdk-install/sdk-install.sh
> @@ -0,0 +1,102 @@
> +#!/bin/sh
> +
> +# Permission is hereby granted, free of charge, to any person obtaining a copy
> +# of this software and associated documentation files (the "Software"), to deal
> +# in the Software without restriction, including without limitation the rights
> +# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> +# copies of the Software, and to permit persons to whom the Software is
> +# furnished to do so, subject to the following conditions:
> +#
> +# The above copyright notice and this permission notice shall be included in
> +# all copies or substantial portions of the Software.
> +#
> +# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> +# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> +# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> +# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> +# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> +# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> +# THE SOFTWARE.
> +
> +# Process command line...
> +while [ $# -gt 0 ]; do
> +  case $1 in
> +    --install_dir)
> +      shift;
> +      install_dir=$1;
> +      ;;
> +     *)
> +      shift;
> +      ;;
> +  esac
> +done
> +
> +if [ "x$install_dir" = "x" ]; then
> +    # Verify that the script is being called within untar SDK directory
> +    if [ ! -d "$PWD/board-support" -a ! -f "$PWD/Rules.make" ]; then
> +        echo "Script must be called within untarred sdk directory"
> +        exit 1
> +    else
> +        install_dir="$PWD"
> +    fi
> +fi
> +
> +# Get full path to SDK directory
> +cd "$install_dir"
> +install_dir="$PWD"
> +cd -
> +
> +if [ ! -d $install_dir ]; then
> +	echo "Installation directory does not exist"
> +	exit 1
> +fi
> +
> +# Remove any .svn directories that were packaged by the sourceipks
> +rm -rf `find $install_dir -name ".svn"`
> +
> +
> +# Update Rules.make variables
> +
> +sed -i -e s=__SDK__INSTALL_DIR__=$install_dir= $install_dir/Rules.make 
> +
> +# Find the linux directory name
> +linux=`find $install_dir/board-support -maxdepth 1 -name "linux*"`
> +linux=`basename $linux`
> +sed -i -e s=__KERNEL_NAME__=$linux= $install_dir/Rules.make
> +cd -
> +
> +
> +# Install toolchain sdk
> +$install_dir/linux-devkit.sh -y -d $install_dir/linux-devkit
> +
> +# Remove toolchain sdk
> +rm $install_dir/linux-devkit.sh
> +
> +
> +# Update example applications CCS project files
> +
> +# Grab some essential variables from environment-setup
> +TARGET_SYS=`sed -n 's/^export TARGET_SYS=//p' $install_dir/linux-devkit/environment-setup`
> +TOOLCHAIN_SYS=`sed -n 's/^export TOOLCHAIN_SYS=//p' $install_dir/linux-devkit/environment-setup`
> +SDK_SYS=`sed -n 's/^export SDK_SYS=//p' $install_dir/linux-devkit/environment-setup`
> +
> +# Grab toolchain's GCC version
> +GCC_VERSION=`ls $install_dir/linux-devkit/sysroots/$SDK_SYS/usr/lib/gcc/$TOOLCHAIN_SYS/`
> +
> +TOOLCHAIN_TARGET_INCLUDE_DIR="linux-devkit/sysroots/$TARGET_SYS/usr/include"
> +TOOLCHAIN_INCLUDE_DIR="linux-devkit/sysroots/$SDK_SYS/usr/lib/gcc/$TOOLCHAIN_SYS/$GCC_VERSION/include"
> +
> +# Update CCS project files using important paths to headers
> +
> +find $install_dir/example-applications -type f -exec sed -i "s|<TOOLCHAIN_TARGET_INCLUDE_DIR>|$TOOLCHAIN_TARGET_INCLUDE_DIR|g" {} \;
> +find $install_dir/example-applications -type f -exec sed -i "s|<TOOLCHAIN_INCLUDE_DIR>|$TOOLCHAIN_INCLUDE_DIR|g" {} \;
> +
> +
> +if [ -f "$install_dir/sdk-install.sh" ]; then
> +	# File is only able to run once so delete it from the SDK
> +	rm "$install_dir/sdk-install.sh"
> +fi
> +
> +echo "Installation completed!"
> +exit 0
> +
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-install/ti-tisdk-install_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-install/ti-tisdk-install_1.0.bb
> new file mode 100644
> index 0000000..26a6966
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-install/ti-tisdk-install_1.0.bb
> @@ -0,0 +1,15 @@
> +DESCRIPTION = "Contains script to properly extract and update various files"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://../sdk-install.sh;beginline=3;endline=19;md5=4b89903784b8d154cd8b631388da4f0d"
> +
> +SRC_URI = "file://sdk-install.sh"
> +
> +PR = "r0"
> +
> +do_install () {
> +    install -d ${D}/
> +    install  ${WORKDIR}/sdk-install.sh ${D}/sdk-install.sh
> +
> +}
> +
> +FILES_${PN} = "/*"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

