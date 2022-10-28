Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EC6BFA373D
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 01:03:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.1285.1666919023344623807
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 27 Oct 2022 18:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6BABC40D27;
	Fri, 28 Oct 2022 01:03:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jCOsdTAhi63E; Fri, 28 Oct 2022 01:03:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3BFA640D12;
	Fri, 28 Oct 2022 01:03:41 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 12EDF162035;
	Thu, 27 Oct 2022 21:03:38 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH] meta-arago-distro: drop support for handling source IPKs in SDK
Date: Fri, 28 Oct 2022 01:03:33 +0000
Message-Id: <20221028010333.866303-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 28 Oct 2022 01:03:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14093

From: Denys Dmytriyenko <denys@konsulko.com>

As support for top-level Makefile in SDK is being dropped, there's no nee=
d to
generate source IPK packages to include sources in the SDK for cross-comp=
iling.
Generation of source IPKs is a bit kludgy as it's not supported upstream =
or by
opkg, hence it often gets in the way of migrating the layer to the new re=
lease.
Therefore, remove sourceipk.bbclass, arago-source-ipk.inc package configs=
 and
corresponding packagegroup-*-sdk-host.bb that pulled src packages to the =
SDK.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/classes/sourceipk.bbclass   | 305 ---------------
 meta-arago-distro/conf/distro/arago.conf      |   3 -
 .../conf/distro/include/arago-source-ipk.inc  | 368 ------------------
 .../recipes-core/images/tisdk-core-bundle.inc |  10 +-
 ...ackagegroup-arago-tisdk-addons-sdk-host.bb | 104 -----
 ...packagegroup-arago-tisdk-amsdk-sdk-host.bb |  14 +-
 ...ackagegroup-arago-tisdk-crypto-sdk-host.bb |  18 -
 ...kagegroup-arago-tisdk-graphics-sdk-host.bb |  14 -
 .../packagegroup-arago-tisdk-hmi-sdk-host.bb  |  37 --
 ...ackagegroup-arago-tisdk-matrix-sdk-host.bb |  17 -
 ...gegroup-arago-tisdk-multimedia-sdk-host.bb |  41 --
 ...ackagegroup-arago-tisdk-opencl-sdk-host.bb |  22 --
 .../packagegroup-arago-tisdk-qte-sdk-host.bb  |  11 -
 .../recipes-kernel/linux/copy-defconfig.inc   |  22 --
 .../linux/linux-ti-staging-rt_%.bbappend      |   1 -
 .../linux/linux-ti-staging-systest_%.bbappend |   1 -
 .../linux/linux-ti-staging_%.bbappend         |   1 -
 17 files changed, 2 insertions(+), 987 deletions(-)
 delete mode 100644 meta-arago-distro/classes/sourceipk.bbclass
 delete mode 100644 meta-arago-distro/conf/distro/include/arago-source-ip=
k.inc
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packageg=
roup-arago-tisdk-addons-sdk-host.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packageg=
roup-arago-tisdk-crypto-sdk-host.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packageg=
roup-arago-tisdk-graphics-sdk-host.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packageg=
roup-arago-tisdk-hmi-sdk-host.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packageg=
roup-arago-tisdk-matrix-sdk-host.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packageg=
roup-arago-tisdk-multimedia-sdk-host.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packageg=
roup-arago-tisdk-opencl-sdk-host.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packageg=
roup-arago-tisdk-qte-sdk-host.bb
 delete mode 100644 meta-arago-distro/recipes-kernel/linux/copy-defconfig=
.inc

diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-arago-dis=
tro/classes/sourceipk.bbclass
deleted file mode 100644
index 5ffb75a8..00000000
--- a/meta-arago-distro/classes/sourceipk.bbclass
+++ /dev/null
@@ -1,305 +0,0 @@
-# sourceipk.bbclass enables the creation of an ipk file that contains th=
e
-# sources used during the build.  The sources contained in the ipk are t=
he
-# patched sources before configuration has been done.
-#
-# This class is used to provide an easy method to ship the corresponding
-# sources for a package to end users so that they can install them on th=
eir
-# host or target systems.
-#
-# This package uses the following variables to control its operations:
-#   - CREATE_SRCIPK         =3D When set to 1 this variable indicates th=
at=20
-#                             a source ipk should be generated for the p=
ackage.
-#   - SRCIPK_INSTALL_DIR    =3D This variable indicates the directory to=
 install
-#                             the sources into.
-#   - SRCIPK_PACKAGE_ARCH   =3D This variable allows specific recipies t=
o
-#                             specify an architecture for the sourcetree
-#                             package, defaults to the same as binary pk=
g
-#   - SRCIPK_INC_EXTRAFILES =3D When set to 1 this variable indicates th=
at
-#                             the source ipk should contain extra files
-#                             such as the README file and recipe.
-#
-# The default installation directory for the sources is:
-#   /usr/src/${PN}-source
-#
-# By setting the SRCIPK_INSTALL_DIR this default can be changed to any
-# location desired.  When combined with the opkg -o option this allows f=
or the
-# system building to specify a relative package install location to the
-# install root given to opkg.  Each source ipk can have a different dire=
ctory.
-#=20
-# Creation of the source ipk can be controlled per package by setting
-# CREATE_SRCIPK =3D "1" in the package recipe or by setting
-# CREATE_SRCIPK:pn-<package name> =3D "1" in your local.conf
-#
-#TODO:=20
-# Need to figure out how to use opkg-build in this class.
-# I tried adding it as a dependency for the do_create_srcipk
-# task using:
-#   do_create_srcipk[depends] +=3D "opkg-utils-native:do_populate_sysroo=
t"
-# But then there is a circular dependency between sourcipk.bbclass and
-# opkg-utils-native.  Until I can figure out how to resolve this
-# circular dependency I am extracting the needed pieces from opkg-build
-# into this class and building the source ipk myself.
-
-
-# Default is to not create the source ipk
-CREATE_SRCIPK ?=3D "0"
-
-# Default installation prefix
-SRCIPK_INSTALL_DIR ?=3D "/usr/src/${PN}-source"
-
-# Directory to preserve sources until they can be installed for packagin=
g
-SRCIPK_STAGING_DIR =3D "${WORKDIR}/srcipk-staging"
-
-# Specify the directory of the sources
-SRCIPK_SRC_DIR ?=3D "${S}"
-
-# Default PACKAGE_ARCH for sources is "all"
-SRCIPK_PACKAGE_ARCH ?=3D "${PACKAGE_ARCH}"
-
-# Default section matches the recipe section
-SRCIPK_SECTION ?=3D "${SECTION}"
-
-# Default SRCIPK_INCLUDE_EXTRAFILES is to include the extra files
-SRCIPK_INCLUDE_EXTRAFILES ?=3D "1"
-
-SRCIPK_PRESERVE_GIT ?=3D "false"
-
-# Git commit message that explains the purpose of the custom git branch
-SRCIPK_CUSTOM_GIT_MESSAGE ?=3D ""
-
-# File that will store the same information as the commit message but is=
 also
-# used to add something to insure a commit can be committed.
-SRCIPK_SDK_README ?=3D "TISDK-README"
-
-# Name used when creating the custom branch
-SRCIPK_CUSTOM_GIT_BRANCH ?=3D ""
-
-# Create a shallow clone of the git repository to reduce the size of
-# the sourceipk
-SRCIPK_SHALLOW_CLONE ?=3D "false"
-
-# By default limit the history to 1 commit since the user can always
-# use git pull --unshallow to fetch the rest of history.  The depth
-# level of 1 is set to keep from tracking through all merges and
-# pulling excess history
-SRCIPK_SHALLOW_DEPTH ?=3D "1"
-
-# This function will return the fetch URL for a git repository passed as
-# the first parameter.
-get_remote() {
-    git_repo=3D"$1"
-
-    if [ "$git_repo" =3D "" ]
-    then
-        echo "git_repo not passed to get_remote"
-        exit 1
-    fi
-
-    cd $git_repo
-
-    # Get the remote repository fetch URL
-    remote=3D`git remote -v | grep "(fetch)" | cut -d ' ' -f 1   | cut -=
c 7- | tr -d ' '`
-
-    # Since the echo'ed value of this statment is the returned value red=
irect
-    # the output of this command to /dev/null
-    cd - > /dev/null
-
-    # echo back the remote repository URL as the output of this function
-    echo $remote
-
-    return 0
-}
-
-# Some git repositories are very large and we do not want to ship the
-# full history.  Instead we want to limit history to reduce the size whi=
le
-# still keeping the git repository in place.  The full history can be
-# fetched using git pull --unshallow or just git pull
-# NOTE: This function depends on a git version >=3D 1.7.10.  It will wor=
k
-#       with older versions but the size will be larger because rather
-#       than just a single branch the limited history will be a depth of
-#       1 for all branches and tags.
-limit_git_history() {
-
-    # Temporary directory to make shallow clones in
-    gitshallowclone=3D"${WORKDIR}/temp-git-shallow-clone"
-
-    # Change directory to the git repository to be safe
-    cd ${SRCIPK_STAGING_DIR}/${SRCIPK_INSTALL_DIR}
-
-    # Create a temporary directory to hold the shallow git clone
-    mkdir -p $gitshallowclone
-
-    remote=3D`get_remote $PWD`
-
-    # Clone a shallow version of the workdir repo so that the preserved =
git
-    # points to the commit used in the build.
-    git clone --depth ${SRCIPK_SHALLOW_DEPTH} --branch ${BRANCH} file://=
$PWD/.git $gitshallowclone
-
-    # remove original kernel clone since we will replace it with the sha=
llow
-    # clone
-    rm -rf ${SRCIPK_STAGING_DIR}/${SRCIPK_INSTALL_DIR}/.git
-
-    # replace the original kernel git data with the shallow clone git da=
ta
-    mv $gitshallowclone/.git ${SRCIPK_STAGING_DIR}/${SRCIPK_INSTALL_DIR}=
/
-    rm -rf $gitshallowclone
-
-    # Remove the local remote
-    git remote rm origin
-
-    # This is forceful, but unfortuantely, removing the origin remote do=
es not
-    # remove all origin refs, and that causes problems.
-    rm -rf ./.git/refs/remotes/origin
-
-    # Point remote back to upstream
-    git remote add origin $remote
-
-    cd -
-}
-
-adjust_git() {
-    orig_dir=3D"$PWD"
-
-    cd ${SRCIPK_STAGING_DIR}/${SRCIPK_INSTALL_DIR}
-
-    if [ -d ".git" ]
-    then
-        if [ "${SRCIPK_PRESERVE_GIT}" =3D "true" ]
-        then
-            # If SRCIPK_SHALLOW_CLONE is true then make a shallow copy o=
f the
-            # git repository and then fix up the git URLs
-            if [ "${SRCIPK_SHALLOW_CLONE}" =3D "true" ]
-            then
-                limit_git_history
-            fi
-
-            # Repackage the repository so its a proper clone of the orig=
inal
-            # (remote) git repository
-            git repack -a -d
-
-            if [ "${SRCIPK_CUSTOM_GIT_BRANCH}" !=3D "" -a "${SRCIPK_CUST=
OM_GIT_MESSAGE}" !=3D "" ]
-            then
-                # Create local git config settings to create commit
-                git config user.email "<>"
-                git config user.name "Texas Instruments SDK Builder"
-
-                # For recipes like the kernel which may end up running
-                # sourceipk more than once.
-                branch_exist=3D`git branch | grep ${SRCIPK_CUSTOM_GIT_BR=
ANCH}` || echo ""
-                if [ "$branch_exist" !=3D "" -a -f ${SRCIPK_SDK_README} =
]
-                then
-                    git add -A
-                    git commit --amend
-                else
-                    echo -e ${SRCIPK_CUSTOM_GIT_MESSAGE} > ${SRCIPK_SDK_=
README}
-                    git add -A
-                    git commit -F ${SRCIPK_SDK_README}
-                    git checkout -b "${SRCIPK_CUSTOM_GIT_BRANCH}"
-                fi
-
-                # Delete local git config settings previously set
-                git config --unset user.email
-                git config --unset user.name
-
-            fi
-
-            rm -f .git/objects/info/alternates
-
-        else
-            rm -rf .git
-        fi
-
-    fi
-
-    cd $orig_dir
-}
-
-# Create a README file that describes the contents of the source ipk
-sourceipk_create_readme() {
-    readme=3D"$1/README.${PN}-source"
-    touch $readme
-    echo 'This package contains the patched sources for ${PN} that' >> $=
readme
-    echo 'were used to generate the ${PN} binary ipk package(s).' >> $re=
adme
-    echo 'This package does not build or generate the binaries' >> $read=
me
-    echo 'directly.  To build the binaries you must either' >> $readme
-    echo 'configure and build the sources yourself or use:' >> $readme
-    echo '    bitbake ${PN}' >> $readme
-    echo '' >> $readme
-    echo 'NOTE: The patches applied to the sources can be found in' >> $=
readme
-    echo "      the \"patches\" directory" >> $readme
-}
-
-do_create_srcipk[dirs] =3D "${SRCIPK_SRC_DIR} ${SRCIPK_STAGING_DIR}"
-do_create_srcipk[cleandirs] =3D "${SRCIPK_STAGING_DIR}"
-do_create_srcipk[umask] =3D "022"
-
-# Create the source ipk file.  The ipk is manually created here instead
-# of using the normal ipk system because some recipes will over write
-# the PACKAGES variable.  Thus if this class added a -source package
-# to the list of packages to be created that package would be lost.
-# See the linux kernel recipe for an example of this issue.
-sourceipk_do_create_srcipk() {
-    if [ ${CREATE_SRCIPK} !=3D "0" ]
-    then
-        # Copy sources for packaging
-        mkdir -p ${SRCIPK_STAGING_DIR}/${SRCIPK_INSTALL_DIR}
-        if [ -e ${SRCIPK_SRC_DIR} ]; then
-            if [ "${SRCIPK_SRC_DIR}" =3D "${WORKDIR}" ]; then
-                excludes=3D'--exclude ./temp --exclude ${SRCIPK_STAGING_=
DIR}'
-            fi
-            tar -C ${SRCIPK_SRC_DIR} -cO $excludes . | tar -C ${SRCIPK_S=
TAGING_DIR}/${SRCIPK_INSTALL_DIR} -xpf -
-        fi
-
-        # Fix up patches/ directory to contain actual patches instead of=
 symlinks
-        if [ -e ${SRCIPK_STAGING_DIR}/${SRCIPK_INSTALL_DIR}/patches ]
-        then
-            mv ${SRCIPK_STAGING_DIR}/${SRCIPK_INSTALL_DIR}/patches ${SRC=
IPK_STAGING_DIR}/${SRCIPK_INSTALL_DIR}/patches-links
-            cp -rL ${SRCIPK_STAGING_DIR}/${SRCIPK_INSTALL_DIR}/patches-l=
inks ${SRCIPK_STAGING_DIR}/${SRCIPK_INSTALL_DIR}/patches
-            rm -rf ${SRCIPK_STAGING_DIR}/${SRCIPK_INSTALL_DIR}/patches-l=
inks
-        fi
-
-        if [ ${SRCIPK_INCLUDE_EXTRAFILES} !=3D "0" ]
-        then
-            sourceipk_create_readme ${SRCIPK_STAGING_DIR}/${SRCIPK_INSTA=
LL_DIR}/
-            cp ${FILE} ${SRCIPK_STAGING_DIR}/${SRCIPK_INSTALL_DIR}/
-        fi
-
-        # Adjust the git repository if there is one.  Do this adjustment
-        # here so we don't have to modify the original sources.
-        adjust_git
-    fi
-}
-
-EXPORT_FUNCTIONS do_create_srcipk
-
-do_create_srcipk[deptask] =3D "do_patch"
-
-addtask create_srcipk after do_patch before do_configure
-
-python () {
-    if d.getVar('do_compileconfigs', False):
-        deps =3D d.getVarFlag('do_compileconfigs', 'deps') or []
-        deps.append('do_create_srcipk')
-        d.setVarFlag('do_compileconfigs', 'deps', deps)
-}
-
-#Add source packages to list of packages OE knows about
-PACKAGES_DYNAMIC +=3D "${PN}-source"
-
-# Do not perform any QA checks on sourceipk packages
-INSANE_SKIP:${PN}-source +=3D "${@oe.utils.conditional("${CREATE_SRCIPK}=
", "0", "", "${ALL_QA}", d)}"
-
-python __anonymous () {
-    if d.getVar("CREATE_SRCIPK") !=3D "0":
-        if '${PN}-source' not in d.getVar("PACKAGES", False):
-            d.appendVar('PACKAGES', ' ${PN}-source')
-        pn =3D d.getVar("PN")
-        d.setVar('FILES:%s-source' % (pn), '${SRCIPK_INSTALL_DIR}')
-}
-
-PACKAGESPLITFUNCS:append =3D " ${@oe.utils.conditional('CREATE_SRCIPK','=
0','','populate_srcipk_package',d)}"
-populate_srcipk_package() {
-    install -d ${PKGDEST}/${PN}-source/${SRCIPK_INSTALL_DIR}
-    cp -Prf --preserve=3Dmode,timestamps --no-preserve=3Downership \
-        ${SRCIPK_STAGING_DIR}/${SRCIPK_INSTALL_DIR}/. \
-        ${PKGDEST}/${PN}-source/${SRCIPK_INSTALL_DIR}
-}
diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro=
/conf/distro/arago.conf
index 088faa16..c1eb8f6d 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -189,9 +189,6 @@ INHERIT +=3D "recipe-data"
 # Load default preferences
 require conf/distro/include/arago-prefs.inc
=20
-# Enable generation of source packages for SDKs
-require conf/distro/include/arago-source-ipk.inc
-
 # Allow branding on top of Arago Distro and Core TI-SDK
 # If ARAGO_BRAND is not set in local.conf, default to core
 ARAGO_BRAND ??=3D "core"
diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b=
/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
deleted file mode 100644
index c03d5383..00000000
--- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
+++ /dev/null
@@ -1,368 +0,0 @@
-#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
-# BOM Configuration file
-#
-# Syntax:
-#   Select one of available providers (recipes) for a package.
-#   Usually used for virtual/xyz style packages. i.e virtual/kernel
-#       PREFERRED_PROVIDER_<pkg> =3D "recipe"
-#       PREFERRED_PROVIDER_<pkg>_<mach> =3D "recipe"
-#   i.e.
-#       PREFERRED_PROVIDER_virtual/kernel =3D "linux-davinci"
-#       PREFERRED_PROVIDER_virtual/kenrel_omap3evm =3D "linux-omap3"
-#
-#   Select one of the available versions for a package
-#       PREFERRED_VERSION_<pkg> =3D "X.Y.Z"
-#       PREFERRED_VERSION_<pkg>_<mach> =3D "X.Y.Z"
-#   i.e.
-#       PREFERRED_VERSION_udev =3D "141"
-#       PREFERRED_VERSION_udev_omap3evm =3D "124"
-#
-#   Enable source ipk creation for a package
-#       CREATE_SRCIPK:pn-<pkg> =3D "1"
-#   i.e.
-#       CREATE_SRCIPK:pn-u-boot =3D "1"
-#
-#   Change install diretory of source ipk for a package
-#       SRCIPK_INSTALL_DIR:pn-<pkg> =3D "<install dir>"
-#   i.e.
-#       SRCIPK_INSTALL_DIR:pn-u-boot =3D "board-support/u-boot-source"
-#
-#   Change source ipk architecture for a package
-#       SRCIPK_PACKAGE_ARCH:pn-<pkg> =3D "<arch>"
-#   i.e.
-#       SRCIPK_PACKAGE_ARCH:pn-u-boot =3D "${MACHINE_ARCH}"
-#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
-
-# Enable the creation of source ipks
-INHERIT +=3D "sourceipk"
-
-# Disable including README and recipe files in sourceipks for SDK builds=
.
-SRCIPK_INCLUDE_EXTRAFILES =3D "0"
-
-# Set source ipk packages and install directories
-CREATE_SRCIPK:pn-ti-tisdk-licenses ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-tisdk-licenses ?=3D "docs/licenses"
-
-CREATE_SRCIPK:pn-matrix-gui ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-matrix-gui ?=3D "example-applications/${PN}-${PV}"
-
-CREATE_SRCIPK:pn-ti-crypto-examples ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-crypto-examples ?=3D "example-applications/${PN=
}-${PV}"
-
-CREATE_SRCIPK:pn-qml-carinfo ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-qml-carinfo ?=3D "example-applications/${PN}-${PV}=
"
-
-CREATE_SRCIPK:pn-quick-playground ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-quick-playground ?=3D "example-applications/${PN}-=
${PV}"
-
-CREATE_SRCIPK:pn-qt-catalog ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-qt-catalog ?=3D "example-applications/${PN}-${PV}"
-
-CREATE_SRCIPK:pn-qt-patientcare ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-qt-patientcare ?=3D "example-applications/${PN}-${=
PV}"
-
-CREATE_SRCIPK:pn-qt-tstat ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-qt-tstat ?=3D "example-applications/${PN}-${PV}"
-
-CREATE_SRCIPK:pn-dual-camera-demo ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-dual-camera-demo ?=3D "example-applications/${PN}-=
${PV}"
-
-CREATE_SRCIPK:pn-evse-hmi ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-evse-hmi ?=3D "example-applications/${PN}-${PV}"
-
-CREATE_SRCIPK:pn-protection-relays-hmi ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-protection-relays-hmi ?=3D "example-applications/$=
{PN}-${PV}"
-
-CREATE_SRCIPK:pn-mmwavegesture-hmi ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-mmwavegesture-hmi ?=3D "example-applications/${PN}=
-${PV}"
-
-CREATE_SRCIPK:pn-pdm-anomaly-detection ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-pdm-anomaly-detection ?=3D "example-applications/$=
{PN}-${PV}"
-
-CREATE_SRCIPK:pn-tiovx-app-host ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-tiovx-app-host ?=3D "example-applications/${PN}-${=
PV}"
-
-CREATE_SRCIPK:pn-image-gallery ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-image-gallery ?=3D "example-applications/${PN}"
-
-CREATE_SRCIPK:pn-matrix-gui-browser ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-matrix-gui-browser ?=3D "example-applications/${PN=
}-${PV}"
-
-CREATE_SRCIPK:pn-refresh-screen ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-refresh-screen ?=3D "example-applications/${PN}-${=
PV}"
-
-CREATE_SRCIPK:pn-am-sysinfo ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-am-sysinfo ?=3D "example-applications/${PN}-${PV}"
-
-CREATE_SRCIPK:pn-oprofile-example ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-oprofile-example ?=3D "example-applications/${PN}"
-
-CREATE_SRCIPK:pn-arm-benchmarks ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-arm-benchmarks ?=3D "example-applications/${PN}-${=
PV}"
-
-CREATE_SRCIPK:pn-omapconf ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-omapconf ?=3D "example-applications/${PN}-${PV}"
-
-CREATE_SRCIPK:pn-ti-pru-sw-examples ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-pru-sw-examples ?=3D "example-applications/pru-=
${PV}"
-
-CREATE_SRCIPK:pn-ti-ocf-crypto-module ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-ocf-crypto-module ?=3D "board-support/extra-dri=
vers/${PN}-${PV}"
-
-CREATE_SRCIPK:pn-ti-compat-wireless-wl18xx ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-compat-wireless-wl18xx ?=3D "board-support/extr=
a-drivers/${PN}-${PV}"
-
-CREATE_SRCIPK:pn-wl18xx-fw ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-wl18xx-fw ?=3D "board-support/extra-drivers/${PN}-=
${PV}"
-
-CREATE_SRCIPK:pn-wl1271-wlan-cli ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-wl1271-wlan-cli ?=3D "example-applications/wlan"
-
-CREATE_SRCIPK:pn-av-examples ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-av-examples ?=3D "example-applications/av-examples=
-${PV}"
-
-CREATE_SRCIPK:pn-u-boot ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-u-boot ?=3D "board-support/u-boot-${PV}"
-
-CREATE_SRCIPK:pn-u-boot-ti-staging ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-u-boot-ti-staging ?=3D "board-support/u-boot-${PV}=
${UBOOT_LOCALVERSION}"
-SRCIPK_PRESERVE_GIT:pn-u-boot-ti-staging ?=3D "true"
-
-CREATE_SRCIPK:pn-u-boot-dra7xx ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-u-boot-dra7xx ?=3D "board-support/u-boot-${PV}-${P=
R}"
-
-CREATE_SRCIPK:pn-trusted-firmware-a ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-trusted-firmware-a ?=3D "board-support/${PN}-${PV}=
"
-SRCIPK_PRESERVE_GIT:pn-trusted-firmware-a ?=3D "true"
-
-CREATE_SRCIPK:pn-linux-ti-staging ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-linux-ti-staging ?=3D "board-support/linux-${PV}${=
KERNEL_LOCALVERSION}"
-SRCIPK_PRESERVE_GIT:pn-linux-ti-staging ?=3D "true"
-SRCIPK_SHALLOW_CLONE:pn-linux-ti-staging ?=3D "true"
-
-CREATE_SRCIPK:pn-linux-ti-staging-rt ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-linux-ti-staging-rt ?=3D "board-support/linux-rt-$=
{PV}${KERNEL_LOCALVERSION}"
-SRCIPK_PRESERVE_GIT:pn-linux-ti-staging-rt ?=3D "true"
-SRCIPK_SHALLOW_CLONE:pn-linux-ti-staging-rt ?=3D "true"
-
-CREATE_SRCIPK:pn-linux-ti-staging-systest ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-linux-ti-staging-systest ?=3D "board-support/linux=
-systest-${PV}${KERNEL_LOCALVERSION}"
-SRCIPK_PRESERVE_GIT:pn-linux-ti-staging-systest ?=3D "true"
-SRCIPK_SHALLOW_CLONE:pn-linux-ti-staging-systest ?=3D "true"
-
-CREATE_SRCIPK:pn-sitara-linux-ti-staging ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-sitara-linux-ti-staging ?=3D "board-support/linux-=
${PV}${KERNEL_LOCALVERSION}"
-SRCIPK_PRESERVE_GIT:pn-sitara-linux-ti-staging ?=3D "true"
-SRCIPK_SHALLOW_CLONE:pn-sitara-linux-ti-staging ?=3D "true"
-SRCIPK_SHALLOW_DEPTH:pn-sitara-linux-ti-staging ?=3D "400"
-
-CREATE_SRCIPK:pn-linux-am335x-psp ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-linux-am335x-psp ?=3D "board-support/linux-${KVER}=
"
-
-CREATE_SRCIPK:pn-linux-omap ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-linux-omap ?=3D "board-support/linux-${PV}-${PR}"
-
-CREATE_SRCIPK:pn-linux ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-linux ?=3D "board-support/linux-${PV}"
-
-CREATE_SRCIPK:pn-linux-omap4 ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-linux-omap4 ?=3D "board-support/linux-${PV}"
-
-CREATE_SRCIPK:pn-cryptodev-module ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-cryptodev-module ?=3D "board-support/extra-drivers=
/cryptodev-module-${PV}"
-SRCIPK_PRESERVE_GIT:pn-cryptodev-module ?=3D "true"
-
-CREATE_SRCIPK:pn-cmem-mod ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-cmem-mod ?=3D "board-support/extra-drivers/${PN}-$=
{PV}"
-
-CREATE_SRCIPK:pn-debugss-module-drv ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-debugss-module-drv ?=3D "board-support/extra-drive=
rs/${PN}-${PV}"
-
-CREATE_SRCIPK:pn-gdbserverproxy-module-drv ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-gdbserverproxy-module-drv ?=3D "board-support/extr=
a-drivers/${PN}-${PV}"
-
-CREATE_SRCIPK:pn-ti-sgx-ddk-km ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-sgx-ddk-km ?=3D "board-support/extra-drivers/${=
PN}-${PV}"
-
-CREATE_SRCIPK:pn-ti-img-rogue-driver ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-img-rogue-driver ?=3D "board-support/extra-driv=
ers/${PN}-${PV}"
-SRCIPK_PRESERVE_GIT:pn-ti-img-rogue-driver ?=3D "true"
-
-CREATE_SRCIPK:pn-ti-gc320-driver ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-gc320-driver ?=3D "board-support/extra-drivers/=
${PN}-${PV}"
-
-CREATE_SRCIPK:pn-ti-linux-driver-examples ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-linux-driver-examples ?=3D "example-application=
s/linux-driver-examples-${PV}"
-
-CREATE_SRCIPK:pn-ti-linux-driver-examples-omapl ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-linux-driver-examples-omapl ?=3D "example-appli=
cations/linux-driver-examples-${PV}"
-
-CREATE_SRCIPK:pn-ti-framework-components ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-framework-components ?=3D "component-sources/fr=
amework_components_${PV}"
-
-CREATE_SRCIPK:pn-ti-codec-engine ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-codec-engine ?=3D "component-sources/codec_engi=
ne_${PV}"
-
-CREATE_SRCIPK:pn-ti-linuxutils ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-linuxutils ?=3D "component-sources/linuxutils_$=
{PV}"
-
-CREATE_SRCIPK:pn-ti-xdctools ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-xdctools ?=3D "component-sources/xdctools_${PV}=
"
-
-CREATE_SRCIPK:pn-ti-dmai ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-dmai ?=3D "dmai_${PV}"
-
-CREATE_SRCIPK:pn-ti-xdais ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-xdais ?=3D "component-sources/xdais_${PV}"
-
-CREATE_SRCIPK:pn-ti-local-power-manager ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-local-power-manager ?=3D "local-power-manager_$=
{PV}"
-
-CREATE_SRCIPK:pn-ti-codecs-dm355 ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-codecs-dm355 ?=3D "codecs-dm355_${PV}"
-
-CREATE_SRCIPK:pn-ti-dvsdk-demos ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-dvsdk-demos ?=3D "dvsdk-demos_${PV}"
-
-CREATE_SRCIPK:pn-ti-dvtb ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-dvtb ?=3D "dvtb_${PV}"
-
-CREATE_SRCIPK:pn-ti-codecs-dm365 ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-codecs-dm365 ?=3D "codecs-dm365_${PV}"
-
-CREATE_SRCIPK:pn-ti-dm365mm-module ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-dm365mm-module ?=3D "dm365mm-module_${PV}"
-
-CREATE_SRCIPK:pn-ti-codecs-dm6446 ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-codecs-dm6446 ?=3D "codecs-dm6446_${PV}"
-
-CREATE_SRCIPK:pn-ti-codecs-dm6467 ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-codecs-dm6467 ?=3D "codecs-dm6467_${PV}"
-
-CREATE_SRCIPK:pn-ti-codecs-omapl137 ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-codecs-omapl137 ?=3D "codecs-omapl137_${PV}"
-
-CREATE_SRCIPK:pn-ti-codecs-omapl138 ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-codecs-omapl138 ?=3D "codecs-omapl138_${PV}"
-
-CREATE_SRCIPK:pn-ti-cgt6x ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-cgt6x ?=3D "dsp-devkit/cgt6x_${PV}"
-
-CREATE_SRCIPK:pn-ti-cgt470 ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-cgt470 ?=3D "media-controller-devkit/cgt470_${P=
V}"
-
-CREATE_SRCIPK:pn-ti-dspbios ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-dspbios ?=3D "dspbios_${PV}"
-
-CREATE_SRCIPK:pn-ti-sysbios ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-sysbios ?=3D "component-sources/bios_${PV}"
-
-CREATE_SRCIPK:pn-ti-biosutils ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-biosutils ?=3D "biosutils_${PV}"
-
-CREATE_SRCIPK:pn-ti-dsplink ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-dsplink ?=3D "dsplink_${PV}"
-
-CREATE_SRCIPK:pn-ti-syslink ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-syslink ?=3D "component-sources/syslink_${PV}"
-
-CREATE_SRCIPK:pn-ti-edma3lld ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-edma3lld ?=3D "component-sources/edma3lld_${PV}=
"
-
-CREATE_SRCIPK:pn-ti-c6accel ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-c6accel ?=3D "component-sources/c6accel_${PV}"
-
-CREATE_SRCIPK:pn-ti-biospsp ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-biospsp ?=3D "biospsp_${PV}"
-
-CREATE_SRCIPK:pn-ti-audio-soc-example ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-audio-soc-example ?=3D "audio-soc-example_${PV}=
"
-
-CREATE_SRCIPK:pn-ti-c6run ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-c6run ?=3D "component-sources/c6run_${PV}"
-
-CREATE_SRCIPK:pn-ti-osal ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-osal ?=3D "component-sources/osal_${PV}"
-
-CREATE_SRCIPK:pn-ti-ipc ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-ipc ?=3D "component-sources/ipc_${PV}"
-
-CREATE_SRCIPK:pn-ti-dsp-benchmark ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-dsp-benchmark ?=3D "example-applications/dsp-be=
nchmark_${PV}"
-
-CREATE_SRCIPK:pn-gstreamer-ti ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-gstreamer-ti ?=3D "gstreamer-ti_${PV}"
-
-CREATE_SRCIPK:pn-ti-omx ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-omx ?=3D "component-sources/omx_${PV}"
-
-CREATE_SRCIPK:pn-ti-uia ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-uia ?=3D "component-sources/uia_${PV}"
-
-CREATE_SRCIPK:pn-ti-media-controller-utils ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-media-controller-utils ?=3D "board-support/medi=
a-controller-utils_${PV}"
-
-CREATE_SRCIPK:pn-ti-firmware-dm816x ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-firmware-dm816x ?=3D "board-support/prebuilt-im=
ages/dm816x-firmware_${PV}"
-
-CREATE_SRCIPK:pn-ti-firmware-dm814x ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-firmware-dm814x ?=3D "board-support/prebuilt-im=
ages/dm814x-firmware_${PV}"
-
-CREATE_SRCIPK:pn-ti-slog ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-slog ?=3D "component-sources/slog_${PV}"
-
-CREATE_SRCIPK:pn-ti-c674x-aaclcdec ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-ti-c674x-aaclcdec ?=3D "component-sources/c674x-aa=
clcdec_${PV}"
-
-CREATE_SRCIPK:pn-oe-layersetup ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-oe-layersetup ?=3D "bin/oe-layersetup"
-
-CREATE_SRCIPK:pn-opencl-examples ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-opencl-examples ?=3D "example-applications/${PN}-$=
{PV}"
-
-CREATE_SRCIPK:pn-openmpacc-examples ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-openmpacc-examples ?=3D "example-applications/${PN=
}-${PV}"
-
-CREATE_SRCIPK:pn-tidl-examples ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-tidl-examples ?=3D "example-applications/${PN}-${P=
V}"
-SRCIPK_SRC_DIR:pn-tidl-examples ?=3D "${S}/examples"
-
-CREATE_SRCIPK:pn-qt-opencv-opencl-opengl-multithreaded ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-qt-opencv-opencl-opengl-multithreaded ?=3D "exampl=
e-applications/${PN}-${PV}"
-
-CREATE_SRCIPK:pn-libarch-examples ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-libarch-examples ?=3D "example-applications/${PN}-=
${PV}"
-
-CREATE_SRCIPK:pn-linalg-examples ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-linalg-examples ?=3D "example-applications/${PN}-$=
{PV}"
-SRCIPK_SRC_DIR:pn-linalg-examples ?=3D "${EXAMPLES_ROOT}"
-
-CREATE_SRCIPK:pn-barcode-roi ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-barcode-roi ?=3D "example-applications/${PN}-${PV}=
"
-
-CREATE_SRCIPK:pn-boot-monitor ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-boot-monitor ?=3D "board-support/${PN}-${PV}"
-
-CREATE_SRCIPK:pn-hplib-mod ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-hplib-mod ?=3D "board-support/extra-drivers/${PN}-=
${PV}"
-
-CREATE_SRCIPK:pn-uio-module-drv ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-uio-module-drv ?=3D "board-support/extra-drivers/$=
{PN}-${PV}"
-
-CREATE_SRCIPK:pn-pru-icss ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-pru-icss ?=3D "example-applications/${PN}-${PV}"
-
-CREATE_SRCIPK:pn-dsplib-c66x ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-dsplib-c66x ?=3D "component-sources/dsplib_c66x_${=
PV}"
-
-CREATE_SRCIPK:pn-mathlib-c66x ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-mathlib-c66x ?=3D "component-sources/mathlib_c66x_=
${PV}"
-
-CREATE_SRCIPK:pn-imglib-c66x ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-imglib-c66x ?=3D "component-sources/imglib_c66x_${=
PV}"
-
-CREATE_SRCIPK:pn-vlib-c66x ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-vlib-c66x ?=3D "component-sources/vlib_c66x_${PV}"
-
-CREATE_SRCIPK:pn-big-data-ipc-demo-linux ?=3D "1"
-SRCIPK_INSTALL_DIR:pn-big-data-ipc-demo-linux ?=3D "example-applications=
/${PN}-${PV}"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc =
b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
index 3c31ba18..90b5ccef 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
@@ -33,13 +33,5 @@ TISDK_TOOLCHAIN =3D "${@bb.utils.contains('MACHINE_FEA=
TURES','gpu','meta-toolchain
 TOOLCHAIN_SUFFIX =3D "${@bb.utils.contains('MACHINE_FEATURES','gpu','-ti=
sdk','-tisdk-server',d)}"
=20
 IMAGE_INSTALL =3D "\
-    packagegroup-arago-tisdk-addons-sdk-host \
-    ${@['','packagegroup-arago-tisdk-opencl-sdk-host'][oe.utils.all_dist=
ro_features(d, 'opencl', True, False) and bb.utils.contains('MACHINE_FEAT=
URES', 'dsp', True, False, d)]} \
-    packagegroup-arago-tisdk-crypto-sdk-host \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-ti=
sdk-graphics-sdk-host','',d)} \
-    packagegroup-arago-tisdk-matrix-sdk-host \
-    packagegroup-arago-tisdk-multimedia-sdk-host \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-ti=
sdk-hmi-sdk-host','',d)} \
-    packagegroup-arago-tisdk-amsdk-sdk-host${ARAGO_KERNEL_SUFFIX} \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-ti=
sdk-qte-sdk-host','',d)} \
+    packagegroup-arago-tisdk-amsdk-sdk-host \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegrou=
ps/packagegroup-arago-tisdk-addons-sdk-host.bb
deleted file mode 100644
index d79d2756..00000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons-sdk-host.bb
+++ /dev/null
@@ -1,104 +0,0 @@
-DESCRIPTION =3D "Task to install sources for additional utilities/demos =
for SDKs"
-LICENSE =3D "MIT"
-PR =3D "r37"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-inherit packagegroup
-
-UTILS =3D " \
-    am-sysinfo-source \
-    arm-benchmarks-source \
-    oprofile-example-source \
-"
-
-# ti-pru-sw-edma-driver is currently broken
-# Add pru and profibus sources for omapl138 devices
-#UTILS:append:omapl138 =3D " \
-#    ti-pru-sw-examples-source \
-#"
-
-UTILS:append:omap-a15 =3D " \
-    omapconf-source \
-    pru-icss-source \
-"
-
-UTILS:append:ti33x =3D " \
-    omapconf-source \
-    pru-icss-source \
-"
-
-UTILS:append:ti43x =3D " \
-    pru-icss-source \
-"
-
-UTILS:append:k3 =3D " \
-    ti-sci-fw-source \
-    trusted-firmware-a-source \
-"
-
-UTILS:append:j721e-evm =3D " \
-    pru-icss-source \
-"
-
-UTILS:append:j721e-hs-evm =3D " \
-    pru-icss-source \
-"
-
-UTILS:append:am65xx =3D " \
-    pru-icss-source \
-"
-
-UTILS:append:am64xx =3D " \
-    pru-icss-source \
-"
-
-EXTRA_LIBS =3D ""
-
-EXTRA_LIBS:append:omap-a15 =3D " \
-    cmem-mod-source \
-    uio-module-drv-source \
-    big-data-ipc-demo-linux-source \
-"
-
-#EXTRA_LIBS:append:dra7xx =3D " \
-#    debugss-module-drv-source \
-#    gdbserverproxy-module-drv-source \
-#"
-
-EXTRA_LIBS:append:ti33x =3D " \
-    uio-module-drv-source \
-"
-
-EXTRA_LIBS:append:ti43x =3D " \
-    cmem-mod-source \
-    uio-module-drv-source \
-"
-
-PDM_ANOMALY_PKG_SRC =3D "\
-    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'pdm-anomaly-detecti=
on-source', '', d)} \
-"
-
-EXTRA_PACKAGES =3D ""
-
-EXTRA_PACKAGES:append:omap-a15 =3D " \
-    ${PDM_ANOMALY_PKG_SRC} \
-"
-
-EXTRA_PACKAGES:append:ti33x =3D " \
-    ${PDM_ANOMALY_PKG_SRC} \
-"
-
-EXTRA_PACKAGES:append:ti43x =3D " \
-    ${PDM_ANOMALY_PKG_SRC} \
-"
-
-EXTRA_PACKAGES:append:am65xx =3D " \
-    ${PDM_ANOMALY_PKG_SRC} \
-"
-
-RDEPENDS:${PN} =3D "\
-    ${UTILS} \
-    ${EXTRA_LIBS} \
-    ${EXTRA_PACKAGES} \
-"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroup=
s/packagegroup-arago-tisdk-amsdk-sdk-host.bb
index 2870d7ed..1a43d0ef 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-amsdk-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-amsdk-sdk-host.bb
@@ -1,20 +1,11 @@
 DESCRIPTION =3D "Task to install additional scripts and applications int=
o the SDK"
 LICENSE =3D "MIT"
-PR =3D "r29"
-
-PN =3D "packagegroup-arago-tisdk-amsdk-sdk-host${ARAGO_KERNEL_SUFFIX}"
+PR =3D "r30"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 inherit packagegroup
=20
-# Choose the kernel and u-boot recipe sources to use
-UBOOT_SRC =3D "${PREFERRED_PROVIDER_virtual/bootloader}-source"
-KERNEL_SRC =3D "${PREFERRED_PROVIDER_virtual/kernel}-source"
-
-KERNEL_SHADOW_CLONE :=3D "${PREFERRED_PROVIDER_virtual/kernel}"
-KERNEL_SHADOW_CLONE_ENABLED :=3D "${SRCIPK_SHALLOW_CLONE:pn-${KERNEL_SHA=
DOW_CLONE}}"
-
 EXTRA_FILES =3D ""
 EXTRA_FILES:ti43x =3D "tisdk-uenv"
 EXTRA_FILES:omap-a15 =3D "tisdk-readme tisdk-uenv"
@@ -23,8 +14,5 @@ EXTRA_FILES:k3 =3D "tisdk-readme tisdk-uenv"
 RDEPENDS:${PN} =3D "\
     ti-tisdk-setup \
     ${EXTRA_FILES} \
-    ${UBOOT_SRC} \
-    ${KERNEL_SRC} \
-    ${@oe.utils.conditional('KERNEL_SHADOW_CLONE_ENABLED','true','unshal=
low-repositories','',d)} \
     tisdk-install \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-crypto-sdk-host.bb b/meta-arago-distro/recipes-core/packagegrou=
ps/packagegroup-arago-tisdk-crypto-sdk-host.bb
deleted file mode 100644
index 2dad8bd7..00000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-crypto-sdk-host.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION =3D "Task to install crypto sources in SDK"
-LICENSE =3D "MIT"
-PR =3D "r11"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-inherit packagegroup
-
-CRYPTO_RDEPENDS =3D ""
-
-CRYPTO_RDEPENDS:append:ti33x =3D " cryptodev-module-source"
-CRYPTO_RDEPENDS:append:ti43x =3D " cryptodev-module-source"
-CRYPTO_RDEPENDS:append:dra7xx =3D " cryptodev-module-source"
-CRYPTO_RDEPENDS:append:k3 =3D " cryptodev-module-source"
-
-RDEPENDS:${PN} =3D "\
-    ${CRYPTO_RDEPENDS} \
-"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-graphics-sdk-host.bb b/meta-arago-distro/recipes-core/packagegr=
oups/packagegroup-arago-tisdk-graphics-sdk-host.bb
deleted file mode 100644
index 01ccd7d5..00000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-graphics-sdk-host.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY =3D "Task to install graphics sources in SDK"
-LICENSE =3D "MIT"
-PR =3D "r8"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-inherit packagegroup features_check
-
-REQUIRED_MACHINE_FEATURES =3D "gpu"
-
-RDEPENDS:${PN} =3D "\
-    ${PREFERRED_PROVIDER_virtual/gpudriver}-source \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'gc320', 'ti-gc320-driver-s=
ource', '', d)} \
-"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-hmi-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/=
packagegroup-arago-tisdk-hmi-sdk-host.bb
deleted file mode 100644
index 2cd7ae6b..00000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-hmi-sdk-host.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-SUMMARY =3D "Task to add HMI related sources into the SDK"
-LICENSE =3D "MIT"
-PR =3D "r1"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-inherit packagegroup features_check
-
-REQUIRED_MACHINE_FEATURES =3D "gpu"
-
-HMI =3D ""
-
-HMI:append:ti43x =3D " \
-    evse-hmi-source \
-    mmwavegesture-hmi-source \
-"
-
-HMI:append:ti33x =3D " \
-    evse-hmi-source \
-    protection-relays-hmi-source \
-    mmwavegesture-hmi-source \
-"
-
-
-HMI:append:omap-a15 =3D " \
-    evse-hmi-source \
-    mmwavegesture-hmi-source \
-"
-
-HMI:append:am65xx =3D " \
-    evse-hmi-source \
-    mmwavegesture-hmi-source \
-"
-
-RDEPENDS:${PN} =3D "\
-    ${HMI} \
-"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-matrix-sdk-host.bb b/meta-arago-distro/recipes-core/packagegrou=
ps/packagegroup-arago-tisdk-matrix-sdk-host.bb
deleted file mode 100644
index c32966bb..00000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-matrix-sdk-host.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION =3D "Task to install Matrix v2 and associated applications s=
ources in the SDK"
-LICENSE =3D "MIT"
-PR =3D "r7"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-inherit packagegroup
-
-MATRIX_GUI =3D " \
-    matrix-gui-browser-source \
-    refresh-screen-source \
-"
-
-RDEPENDS:${PN} =3D "\
-    matrix-gui-source \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu',"${MATRIX_GUI}",'',d)}=
 \
-"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-multimedia-sdk-host.bb b/meta-arago-distro/recipes-core/package=
groups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
deleted file mode 100644
index d377f500..00000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-multimedia-sdk-host.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-SUMMARY =3D "Task to add multimedia related sources into the SDK"
-LICENSE =3D "MIT"
-PR =3D "r15"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-inherit packagegroup
-
-BARCODE_PKG =3D ""
-#BARCODE_PKG =3D " \
-#    ${@['','barcode-roi-source'][oe.utils.all_distro_features(d, 'openc=
v', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, F=
alse, d)]} \
-#"
-
-DUAL_CAMERA_PKG =3D "${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'du=
al-camera-demo-source', '', d)}"
-IMAGE_GALLERY_PKG =3D "${@bb.utils.contains('MACHINE_FEATURES', 'gpu','i=
mage-gallery-source', '', d)}"
-
-MULTIMEDIA =3D ""
-
-MULTIMEDIA:append:ti33x =3D " ${BARCODE_PKG}"
-
-MULTIMEDIA:append:ti43x =3D " \
-    ${DUAL_CAMERA_PKG} \
-    ${IMAGE_GALLERY_PKG} \
-    ${BARCODE_PKG} \
-"
-
-MULTIMEDIA:append:omap-a15 =3D " \
-    ${DUAL_CAMERA_PKG} \
-    ${IMAGE_GALLERY_PKG} \
-    ${BARCODE_PKG} \
-"
-
-MULTIMEDIA:append:am65xx =3D " ${BARCODE_PKG}"
-
-#MULTIMEDIA:append:dra7xx =3D " \
-#    ${@['','qt-opencv-opencl-opengl-multithreaded-source'][oe.utils.all=
_distro_features(d, 'opencv opencl opengl', True, False) and bb.utils.con=
tains('MACHINE_FEATURES', 'gpu dsp', True, False, d)]} \
-#"
-
-RDEPENDS:${PN} =3D "\
-    ${MULTIMEDIA} \
-"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-opencl-sdk-host.bb b/meta-arago-distro/recipes-core/packagegrou=
ps/packagegroup-arago-tisdk-opencl-sdk-host.bb
deleted file mode 100644
index ee5bb610..00000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-opencl-sdk-host.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION =3D "Task to install sources for OpenCL/MP apps and demos"
-LICENSE =3D "MIT"
-PR =3D "r1"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-inherit packagegroup features_check
-
-REQUIRED_DISTRO_FEATURES =3D "opencl"
-
-UTILS =3D " \
-    opencl-examples-source \
-    ${@oe.utils.all_distro_features(d, 'openmp', 'openmpacc-examples-sou=
rce')} \
-"
-
-UTILS:append:dra7xx =3D " \
-    ${@oe.utils.all_distro_features(d, 'openmp', 'linalg-examples-source=
')} \
-"
-
-RDEPENDS:${PN} =3D "\
-    ${UTILS} \
-"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-qte-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/=
packagegroup-arago-tisdk-qte-sdk-host.bb
deleted file mode 100644
index 538ec80a..00000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-qte-sdk-host.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-DESCRIPTION =3D "Task to add Qt embedded related sources into the sdk"
-LICENSE =3D "MIT"
-PR =3D "r8"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-inherit packagegroup
-
-RDEPENDS:${PN} =3D "\
-    qt-tstat-source \
-"
diff --git a/meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc b/=
meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc
deleted file mode 100644
index 4347a88a..00000000
--- a/meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc
+++ /dev/null
@@ -1,22 +0,0 @@
-CONFIG_NAME ?=3D "tisdk_${MACHINE}${ARAGO_KERNEL_SUFFIX}_defconfig"
-
-# Copy the configuration file used during the SDK build in Arago to
-# the kernel sources to be packaged into the sourceipk.  Then call
-# the function to build the sourceipk again.  This is done as a
-# do_compile:prepend so that we can pick up any changes to the
-# defconfig thay may have been done by the sanitizer code.
-do_configure:append() {
-    cp ${B}/.config ${S}/arch/${ARCH}/configs/${CONFIG_NAME}
-
-    # Remove defconfig generated by defconfig_builder to avoid confusion=
. This
-    # may not match the config used in the build due to KERNEL_CONFIG_FR=
AGMENTS.
-    config=3D`cat ${WORKDIR}/defconfig | grep use-tisdk-config | cut -d=3D=
 -f2`
-    if [ -n "$config" ]
-    then
-        rm ${S}/arch/${ARCH}/configs/${config}_defconfig
-    fi
-}
-
-# Move create_srcipk task so that the release defconfig is included.
-deltask do_create_srcipk
-addtask create_srcipk after do_configure before do_compile
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%=
.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.=
bbappend
index 402362c2..df55594e 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappe=
nd
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappe=
nd
@@ -2,7 +2,6 @@ MACHINE_KERNEL_PR:append =3D ".arago1"
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
-require copy-defconfig.inc
 require docker.inc
=20
 ALLOW_EMPTY:kernel-devicetree =3D "1"
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-syst=
est_%.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-=
systest_%.bbappend
index 402362c2..df55594e 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.b=
bappend
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.b=
bappend
@@ -2,7 +2,6 @@ MACHINE_KERNEL_PR:append =3D ".arago1"
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
-require copy-defconfig.inc
 require docker.inc
=20
 ALLOW_EMPTY:kernel-devicetree =3D "1"
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bb=
append b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappe=
nd
index f4fac19a..031a8b05 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
@@ -2,7 +2,6 @@ MACHINE_KERNEL_PR:append =3D ".arago5"
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
-require copy-defconfig.inc
 require docker.inc
=20
 ALLOW_EMPTY:kernel-devicetree =3D "1"
--=20
2.25.1



