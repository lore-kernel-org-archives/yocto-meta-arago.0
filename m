Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 91E2A52AAF
	for <meta-arago@arago-project.org>;
	Thu, 14 Apr 2016 17:33:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u3EHXZbq021666;
	Thu, 14 Apr 2016 12:33:35 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u3EHXZ0S008538;
	Thu, 14 Apr 2016 12:33:35 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 14 Apr 2016 12:33:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u3EHXZ9r009184;
	Thu, 14 Apr 2016 12:33:35 -0500
Date: Thu, 14 Apr 2016 13:33:19 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Thomas Kaufmann <Thomas.Kaufmann@duagon.com>
Message-ID: <20160414173319.GI10048@edge>
References: <87f35714305b4138b6523b1f5d7f04f4@chdua14.duagon.ads>
MIME-Version: 1.0
In-Reply-To: <87f35714305b4138b6523b1f5d7f04f4@chdua14.duagon.ads>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: sdk created with arago fido contains hardcoded paths to build system in setup script
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
X-List-Received-Date: Thu, 14 Apr 2016 17:33:39 -0000
X-Groupsio-MsgNum: 7423
Content-Type: multipart/mixed; boundary="TakKZr9L6Hm6aLOc"
Content-Disposition: inline

--TakKZr9L6Hm6aLOc
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Mar 23, 2016 at 12:12:08PM +0000, Thomas Kaufmann wrote:
> Hi I tried to get an answer to this from the TI e2e community, but so far 
> without luck:
> 
> https://e2e.ti.com/support/embedded/linux/f/354/p/500188/1811754#1811754
> 
> My issue is this:
> 
> When I create a SDK for my target platform using arago with the populate_sdk 
> command in bitbake. I receive a self extracting shell script, which unpacks 
> all the rootfs, compilers, libraries and everything. Basically the SDK is 
> working and I am able to develop for my target with it.
> 
> One thing bothers me:
> 
> in the environment-setup-cortexa8hf-vfp-non-linux-gnueabi file which needs 
> to be sourced before using the SDK, there are some hardcoded paths which 
> point to the linaro toolchain as it is installed on the original system, 
> where I actually build the SDK,
> 
> e.g.: export CFLAGS=" 
> -isystem/home/tkaufmann/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/arm-linux-gnueabihf/include 
> -fstack-protector -O2 -pipe -g -feliminate-unused-debug-types"
> 
> similar things are in CFLAGS, CXXFLAGS, LDFLAGS and CPPFLAGS
> 
> The plan was to use the compiler and sysroot as it is available in the SDK. 
> This is working so far for sinple projects without separately installing the 
> linaro toolchain. Why are these linaro based paths in the environment-setup 
> script and how do I get rid of this to not confuse the users of the SDK?
> 
> I appreciate your feedback

Thomas,

Sorry for the delay. I just checked our SDK and there are no hardcoded paths 
in there.

Trying to figure out what's different I see that your setup script is called 
"environment-setup-cortexa8hf-vfp-non-linux-gnueabi" while ours is just simple 
"environment-setup". Also I see you mention populate_sdk in bitbake and now it 
becomes clear - you should be using meta-toolchain-arago-tisdk recipe where 
lots of stuff gets cleanup and configured properly...

Attached is the current environment-setup script from our SDK.

-- 
Denys

--TakKZr9L6Hm6aLOc
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="environment-setup"

SDK_PATH="/tmp/abc"
if [ -z "$ZSH_NAME" ] && [ "x$0" = "x./environment-setup" ]; then
    echo "Error: This script needs to be sourced. Please run as \". ./environment-setup\""
    exit 1
else
    if [ -n "$BASH_SOURCE" ]; then
        SDK_PATH="`dirname $BASH_SOURCE`"
    fi
    SDK_PATH=`readlink -f "$SDK_PATH"`
    export SDK_PATH
fi
export SDK_SYS=x86_64-arago-linux
export REAL_MULTIMACH_TARGET_SYS=cortexa8hf-neon-linux-gnueabi
export TOOLCHAIN_SYS=arm-linux-gnueabihf
export TOOLCHAIN_PREFIX=$TOOLCHAIN_SYS-
export SDK_PATH_NATIVE=$SDK_PATH/sysroots/$SDK_SYS
export SDK_PATH_TARGET=$SDK_PATH/sysroots/$REAL_MULTIMACH_TARGET_SYS
export PATH=$SDK_PATH_NATIVE/usr/bin:$PATH
export CPATH=$SDK_PATH_TARGET/usr/include:$CPATH
export PKG_CONFIG_SYSROOT_DIR=$SDK_PATH_TARGET
export PKG_CONFIG_PATH=$SDK_PATH_TARGET/usr/lib/pkgconfig
export PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
export CONFIG_SITE=$SDK_PATH/site-config-$REAL_MULTIMACH_TARGET_SYS
export CC=${TOOLCHAIN_PREFIX}gcc
export CXX=${TOOLCHAIN_PREFIX}g++
export GDB=${TOOLCHAIN_PREFIX}gdb
export CPP="${TOOLCHAIN_PREFIX}gcc -E"
export NM=${TOOLCHAIN_PREFIX}nm
export AS=${TOOLCHAIN_PREFIX}as
export AR=${TOOLCHAIN_PREFIX}ar
export RANLIB=${TOOLCHAIN_PREFIX}ranlib
export OBJCOPY=${TOOLCHAIN_PREFIX}objcopy
export OBJDUMP=${TOOLCHAIN_PREFIX}objdump
export STRIP=${TOOLCHAIN_PREFIX}strip
export CONFIGURE_FLAGS="--target=arm-linux-gnueabi --host=arm-linux-gnueabi --build=x86_64-linux --with-libtool-sysroot=$SDK_PATH_TARGET"
export CPPFLAGS=" -march=armv7-a -marm -mfpu=neon  -mfloat-abi=hard -mcpu=cortex-a8 --sysroot=$SDK_PATH_TARGET"
export CFLAGS="$CPPFLAGS"
export CXXFLAGS="$CPPFLAGS"
export LDFLAGS=" --sysroot=$SDK_PATH_TARGET"
export OECORE_NATIVE_SYSROOT=$SDK_PATH_NATIVE
export OECORE_TARGET_SYSROOT=$SDK_PATH_TARGET
export OECORE_ACLOCAL_OPTS="-I $SDK_PATH_NATIVE/usr/share/aclocal"
export OECORE_DISTRO_VERSION="2016.03"
export OECORE_SDK_VERSION="2016.03"
export PS1="\[\e[32;1m\][linux-devkit]\[\e[0m\]:\w> "
export PATH=$SDK_PATH_NATIVE/usr/bin/qt5:$PATH
export OE_QMAKE_CFLAGS="$CFLAGS"
export OE_QMAKE_CXXFLAGS="$CXXFLAGS"
export OE_QMAKE_LDFLAGS="$LDFLAGS"
export OE_QMAKE_CC=$CC
export OE_QMAKE_CXX=$CXX
export OE_QMAKE_LINK=$CXX
export OE_QMAKE_AR=$AR
export OE_QMAKE_LIBDIR_QT=$SDK_PATH_TARGET/usr/lib
export OE_QMAKE_INCDIR_QT=$SDK_PATH_TARGET/usr/include/qt5
export OE_QMAKE_HOST_BINDIR_QT=$SDK_PATH_NATIVE/usr/bin/qt5/
export OE_QMAKE_MOC=$SDK_PATH_NATIVE/usr/bin/qt5/moc
export OE_QMAKE_UIC=$SDK_PATH_NATIVE/usr/bin/qt5/uic
export OE_QMAKE_UIC3=$SDK_PATH_NATIVE/usr/bin/qt5/uic3
export OE_QMAKE_RCC=$SDK_PATH_NATIVE/usr/bin/qt5/rcc
export OE_QMAKE_QDBUSCPP2XML=$SDK_PATH_NATIVE/usr/bin/qt5/qdbuscpp2xml
export OE_QMAKE_QDBUSXML2CPP=$SDK_PATH_NATIVE/usr/bin/qt5/qdbusxml2cpp
export OE_QMAKE_QT_CONFIG=$SDK_PATH_TARGET/usr/lib/qt5/mkspecs/qconfig.pri
export OE_QMAKE_STRIP="echo"
export QMAKESPEC=$SDK_PATH_TARGET/usr/lib/qt5/mkspecs/linux-oe-g++
export QMAKE_DEFAULT_LIBDIRS=${QT_QMAKE_LIBDIR_QT}
export QMAKE_DEFAULT_INCDIRS=${QT_QMAKE_INCDIR_QT}

--TakKZr9L6Hm6aLOc--
