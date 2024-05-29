Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E16D9C25B75
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 12:25:39 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.12515.1716985536474341514
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 29 May 2024 05:25:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=xU0exSqh;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44TCPWRH088467;
	Wed, 29 May 2024 07:25:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1716985532;
	bh=rQABHEiBAqR189/0u2CjvKRweW/3o8+19wtEvVLxCsg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=xU0exSqhZUlKgtCHE0hmMyH88K9GoXJFwoYKTBF8KQfgb91/HM7fO5H9U8w6rR9OY
	 eP7GHxWAf/Q6XAw9F3C8Mjk8v05XJl3lJCYkRpro3PEj7winLaZ6EajDtuRaV6AhyJ
	 w72i8HrusI8dS2jXLUZw/DD43HV8SKafchG38VdE=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44TCPWIS069216
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 29 May 2024 07:25:32 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 29
 May 2024 07:25:32 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 29 May 2024 07:25:32 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44TCPUrl059936;
	Wed, 29 May 2024 07:25:31 -0500
Message-ID: <0b5bb5c2-0512-451c-a2b7-b7e04f4997c2@ti.com>
Date: Wed, 29 May 2024 17:55:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-arago] [master/scarthgap/kirkstone][PATCH]
 busybox: convert custom old defconfig to config fragments
To: <meta-arago@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>,
        Denys Dmytriyenko
	<denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        Gyan Gupta <g-gupta@ti.com>
References: <20240517000903.3546605-1-denis@denix.org>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240517000903.3546605-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 44TCPWRH088467
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 29 May 2024 12:25:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15341

On 17/05/24 05:39, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@=E2=80=8Akonsulko.=E2=80=8Acom> Dismantl=
e the original=20
> custom defconfig with over a decade worth of config changes into=20
> smaller config fragments. Also remove unused patch - it was not being=20
> applied and rtcwake is no longer
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe. If you wish to report this=20
> message to IT Security, please forward the message as an attachment to=20
> phishing@list.ti.com
> ZjQcmQRYFpfptBannerEnd
> From: Denys Dmytriyenko <denys@konsulko.com>
>
> Dismantle the original custom defconfig with over a decade worth of con=
fig
> changes into smaller config fragments.
>
> Also remove unused patch - it was not being applied and rtcwake is no l=
onger
> used from busybox.
>
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>

Acked-by: Chirag Shilwant <c-shilwant@ti.com>

> ---
>   ...-Allow-poweroff-with-rtcwake-command.patch |   56 -
>   .../recipes-core/busybox/busybox/defconfig    | 1010 ----------------=
-
>   .../recipes-core/busybox/busybox/network.cfg  |   19 +
>   .../recipes-core/busybox/busybox/utils.cfg    |   15 +
>   .../recipes-core/busybox/busybox_%.bbappend   |    8 +-
>   5 files changed, 39 insertions(+), 1069 deletions(-)
>   delete mode 100644 meta-arago-distro/recipes-core/busybox/busybox/000=
1-rtcwake-Allow-poweroff-with-rtcwake-command.patch
>   delete mode 100644 meta-arago-distro/recipes-core/busybox/busybox/def=
config
>   create mode 100644 meta-arago-distro/recipes-core/busybox/busybox/net=
work.cfg
>   create mode 100644 meta-arago-distro/recipes-core/busybox/busybox/uti=
ls.cfg
>
> diff --git a/meta-arago-distro/recipes-core/busybox/busybox/0001-rtcwak=
e-Allow-poweroff-with-rtcwake-command.patch b/meta-arago-distro/recipes-c=
ore/busybox/busybox/0001-rtcwake-Allow-poweroff-with-rtcwake-command.patc=
h
> deleted file mode 100644
> index da47888e..00000000
> --- a/meta-arago-distro/recipes-core/busybox/busybox/0001-rtcwake-Allow=
-poweroff-with-rtcwake-command.patch
> +++ /dev/null
> @@ -1,56 +0,0 @@
> -From 81e46127ec781dec6789457e918582a5a4eae50a Mon Sep 17 00:00:00 2001
> -From: Dave Gerlach <d-gerlach@ti.com>
> -Date: Tue, 9 Jun 2015 10:54:19 -0500
> -Subject: [PATCH] rtcwake: Allow poweroff with rtcwake command
> -
> -rtcwake will support poweroff as an option for -m with this
> -patch by calling poweroff from the command line and also not disabling
> -the rtc alarm1 interrupt at exit.
> -
> -Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
> ----
> - util-linux/rtcwake.c | 15 +++++++++++----
> - 1 file changed, 11 insertions(+), 4 deletions(-)
> -
> -diff --git a/util-linux/rtcwake.c b/util-linux/rtcwake.c
> -index 8aee0cfcbd56..a0edee5d8647 100644
> ---- a/util-linux/rtcwake.c
> -+++ b/util-linux/rtcwake.c
> -@@ -133,6 +133,7 @@ int rtcwake_main(int argc UNUSED_PARAM, char **arg=
v)
> -	unsigned seconds =3D seconds; /* for compiler */
> -	int utc =3D -1;
> -	int fd;
> -+        int poweroff =3D 0;
> -
> - #if ENABLE_LONG_OPTS
> -	static const char rtcwake_longopts[] ALIGN1 =3D
> -@@ -211,9 +212,14 @@ int rtcwake_main(int argc UNUSED_PARAM, char **ar=
gv)
> -	fflush_all();
> -	usleep(10 * 1000);
> -
> --	if (strcmp(suspend, "on") !=3D 0)
> --		xopen_xwrite_close(SYS_POWER_PATH, suspend);
> --	else {
> -+	if (strcmp(suspend, "on")) {
> -+		if (!strcmp(suspend, "poweroff")) {
> -+			system("poweroff");
> -+			poweroff =3D 1;
> -+		} else {
> -+			xopen_xwrite_close(SYS_POWER_PATH, suspend);
> -+		}
> -+	} else {
> -		/* "fake" suspend ... we'll do the delay ourselves */
> -		unsigned long data;
> -
> -@@ -226,7 +232,8 @@ int rtcwake_main(int argc UNUSED_PARAM, char **arg=
v)
> -		} while (!(data & RTC_AF));
> -	}
> -
> --	xioctl(fd, RTC_AIE_OFF, 0);
> -+	if (!poweroff)
> -+		xioctl(fd, RTC_AIE_OFF, 0);
> -
> -	if (ENABLE_FEATURE_CLEAN_UP)
> -		close(fd);
> ---
> -1.9.1
> diff --git a/meta-arago-distro/recipes-core/busybox/busybox/defconfig b=
/meta-arago-distro/recipes-core/busybox/busybox/defconfig
> deleted file mode 100644
> index 65470bc7..00000000
> --- a/meta-arago-distro/recipes-core/busybox/busybox/defconfig
> +++ /dev/null
> @@ -1,1010 +0,0 @@
> -#
> -# Automatically generated make config: don't edit
> -# Busybox version: 1.19.3
> -# Wed Nov 30 09:33:16 2011
> -#
> -CONFIG_HAVE_DOT_CONFIG=3Dy
> -
> -#
> -# Busybox Settings
> -#
> -
> -#
> -# General Configuration
> -#
> -# CONFIG_DESKTOP is not set
> -# CONFIG_EXTRA_COMPAT is not set
> -# CONFIG_INCLUDE_SUSv2 is not set
> -# CONFIG_USE_PORTABLE_CODE is not set
> -CONFIG_PLATFORM_LINUX=3Dy
> -CONFIG_FEATURE_BUFFERS_USE_MALLOC=3Dy
> -# CONFIG_FEATURE_BUFFERS_GO_ON_STACK is not set
> -# CONFIG_FEATURE_BUFFERS_GO_IN_BSS is not set
> -CONFIG_SHOW_USAGE=3Dy
> -# CONFIG_FEATURE_VERBOSE_USAGE is not set
> -CONFIG_FEATURE_COMPRESS_USAGE=3Dy
> -# CONFIG_FEATURE_INSTALLER is not set
> -# CONFIG_INSTALL_NO_USR is not set
> -CONFIG_LOCALE_SUPPORT=3Dy
> -# CONFIG_UNICODE_SUPPORT is not set
> -# CONFIG_UNICODE_USING_LOCALE is not set
> -# CONFIG_FEATURE_CHECK_UNICODE_IN_ENV is not set
> -CONFIG_SUBST_WCHAR=3D0
> -CONFIG_LAST_SUPPORTED_WCHAR=3D0
> -# CONFIG_UNICODE_COMBINING_WCHARS is not set
> -# CONFIG_UNICODE_WIDE_WCHARS is not set
> -# CONFIG_UNICODE_BIDI_SUPPORT is not set
> -# CONFIG_UNICODE_NEUTRAL_TABLE is not set
> -# CONFIG_UNICODE_PRESERVE_BROKEN is not set
> -CONFIG_LONG_OPTS=3Dy
> -CONFIG_FEATURE_DEVPTS=3Dy
> -# CONFIG_FEATURE_CLEAN_UP is not set
> -CONFIG_FEATURE_UTMP=3Dy
> -# CONFIG_FEATURE_WTMP is not set
> -CONFIG_FEATURE_PIDFILE=3Dy
> -CONFIG_FEATURE_SUID=3Dy
> -CONFIG_FEATURE_SUID_CONFIG=3Dy
> -CONFIG_FEATURE_SUID_CONFIG_QUIET=3Dy
> -# CONFIG_SELINUX is not set
> -# CONFIG_FEATURE_PREFER_APPLETS is not set
> -CONFIG_BUSYBOX_EXEC_PATH=3D"/proc/self/exe"
> -CONFIG_FEATURE_SYSLOG=3Dy
> -CONFIG_FEATURE_HAVE_RPC=3Dy
> -
> -#
> -# Build Options
> -#
> -# CONFIG_STATIC is not set
> -# CONFIG_PIE is not set
> -# CONFIG_NOMMU is not set
> -# CONFIG_BUILD_LIBBUSYBOX is not set
> -# CONFIG_FEATURE_INDIVIDUAL is not set
> -# CONFIG_FEATURE_SHARED_BUSYBOX is not set
> -CONFIG_LFS=3Dy
> -CONFIG_CROSS_COMPILER_PREFIX=3D""
> -CONFIG_EXTRA_CFLAGS=3D""
> -
> -#
> -# Debugging Options
> -#
> -# CONFIG_DEBUG is not set
> -# CONFIG_DEBUG_PESSIMIZE is not set
> -# CONFIG_WERROR is not set
> -CONFIG_NO_DEBUG_LIB=3Dy
> -# CONFIG_DMALLOC is not set
> -# CONFIG_EFENCE is not set
> -
> -#
> -# Installation Options ("make install" behavior)
> -#
> -CONFIG_INSTALL_APPLET_SYMLINKS=3Dy
> -# CONFIG_INSTALL_APPLET_HARDLINKS is not set
> -# CONFIG_INSTALL_APPLET_SCRIPT_WRAPPERS is not set
> -# CONFIG_INSTALL_APPLET_DONT is not set
> -# CONFIG_INSTALL_SH_APPLET_SYMLINK is not set
> -# CONFIG_INSTALL_SH_APPLET_HARDLINK is not set
> -# CONFIG_INSTALL_SH_APPLET_SCRIPT_WRAPPER is not set
> -CONFIG_PREFIX=3D"./_install"
> -
> -#
> -# Busybox Library Tuning
> -#
> -CONFIG_FEATURE_SYSTEMD=3Dy
> -CONFIG_FEATURE_RTMINMAX=3Dy
> -CONFIG_PASSWORD_MINLEN=3D6
> -CONFIG_MD5_SIZE_VS_SPEED=3D2
> -CONFIG_FEATURE_FAST_TOP=3Dy
> -# CONFIG_FEATURE_ETC_NETWORKS is not set
> -CONFIG_FEATURE_USE_TERMIOS=3Dy
> -CONFIG_FEATURE_EDITING=3Dy
> -CONFIG_FEATURE_EDITING_MAX_LEN=3D1024
> -# CONFIG_FEATURE_EDITING_VI is not set
> -CONFIG_FEATURE_EDITING_HISTORY=3D15
> -CONFIG_FEATURE_EDITING_SAVEHISTORY=3Dy
> -# CONFIG_FEATURE_REVERSE_SEARCH is not set
> -CONFIG_FEATURE_TAB_COMPLETION=3Dy
> -CONFIG_FEATURE_USERNAME_COMPLETION=3Dy
> -CONFIG_FEATURE_EDITING_FANCY_PROMPT=3Dy
> -# CONFIG_FEATURE_EDITING_ASK_TERMINAL is not set
> -CONFIG_FEATURE_NON_POSIX_CP=3Dy
> -# CONFIG_FEATURE_VERBOSE_CP_MESSAGE is not set
> -CONFIG_FEATURE_COPYBUF_KB=3D4
> -CONFIG_FEATURE_SKIP_ROOTFS=3Dy
> -CONFIG_MONOTONIC_SYSCALL=3Dy
> -CONFIG_IOCTL_HEX2STR_ERROR=3Dy
> -CONFIG_FEATURE_HWIB=3Dy
> -
> -#
> -# Applets
> -#
> -
> -#
> -# Archival Utilities
> -#
> -CONFIG_FEATURE_SEAMLESS_XZ=3Dy
> -CONFIG_FEATURE_SEAMLESS_LZMA=3Dy
> -CONFIG_FEATURE_SEAMLESS_BZ2=3Dy
> -CONFIG_FEATURE_SEAMLESS_GZ=3Dy
> -CONFIG_FEATURE_SEAMLESS_Z=3Dy
> -CONFIG_AR=3Dy
> -# CONFIG_FEATURE_AR_LONG_FILENAMES is not set
> -# CONFIG_FEATURE_AR_CREATE is not set
> -CONFIG_BUNZIP2=3Dy
> -# CONFIG_BZIP2 is not set
> -CONFIG_CPIO=3Dy
> -# CONFIG_FEATURE_CPIO_O is not set
> -# CONFIG_FEATURE_CPIO_P is not set
> -# CONFIG_DPKG is not set
> -CONFIG_DPKG_DEB=3Dy
> -CONFIG_FEATURE_DPKG_DEB_EXTRACT_ONLY=3Dy
> -CONFIG_GUNZIP=3Dy
> -CONFIG_GZIP=3Dy
> -# CONFIG_FEATURE_GZIP_LONG_OPTIONS is not set
> -# CONFIG_LZOP is not set
> -# CONFIG_LZOP_COMPR_HIGH is not set
> -# CONFIG_RPM2CPIO is not set
> -# CONFIG_RPM is not set
> -CONFIG_TAR=3Dy
> -CONFIG_FEATURE_TAR_CREATE=3Dy
> -CONFIG_FEATURE_TAR_AUTODETECT=3Dy
> -CONFIG_FEATURE_TAR_FROM=3Dy
> -CONFIG_FEATURE_TAR_OLDGNU_COMPATIBILITY=3Dy
> -# CONFIG_FEATURE_TAR_OLDSUN_COMPATIBILITY is not set
> -CONFIG_FEATURE_TAR_GNU_EXTENSIONS=3Dy
> -# CONFIG_FEATURE_TAR_LONG_OPTIONS is not set
> -# CONFIG_FEATURE_TAR_TO_COMMAND is not set
> -# CONFIG_FEATURE_TAR_UNAME_GNAME is not set
> -CONFIG_FEATURE_TAR_NOPRESERVE_TIME=3Dy
> -# CONFIG_FEATURE_TAR_SELINUX is not set
> -# CONFIG_UNCOMPRESS is not set
> -# CONFIG_UNLZMA is not set
> -# CONFIG_FEATURE_LZMA_FAST is not set
> -# CONFIG_LZMA is not set
> -# CONFIG_UNXZ is not set
> -CONFIG_XZ=3Dy
> -CONFIG_UNZIP=3Dy
> -
> -#
> -# Coreutils
> -#
> -CONFIG_BASENAME=3Dy
> -CONFIG_CAT=3Dy
> -CONFIG_DATE=3Dy
> -# CONFIG_FEATURE_DATE_ISOFMT is not set
> -# CONFIG_FEATURE_DATE_NANO is not set
> -CONFIG_FEATURE_DATE_COMPAT=3Dy
> -CONFIG_ID=3Dy
> -CONFIG_GROUPS=3Dy
> -CONFIG_TEST=3Dy
> -CONFIG_FEATURE_TEST_64=3Dy
> -CONFIG_TOUCH=3Dy
> -CONFIG_TR=3Dy
> -CONFIG_FEATURE_TR_CLASSES=3Dy
> -# CONFIG_FEATURE_TR_EQUIV is not set
> -# CONFIG_BASE64 is not set
> -CONFIG_WHO=3Dy
> -CONFIG_USERS=3Dy
> -# CONFIG_CAL is not set
> -# CONFIG_CATV is not set
> -CONFIG_CHGRP=3Dy
> -CONFIG_CHMOD=3Dy
> -CONFIG_CHOWN=3Dy
> -# CONFIG_FEATURE_CHOWN_LONG_OPTIONS is not set
> -CONFIG_CHROOT=3Dy
> -# CONFIG_CKSUM is not set
> -# CONFIG_COMM is not set
> -CONFIG_CP=3Dy
> -# CONFIG_FEATURE_CP_LONG_OPTIONS is not set
> -CONFIG_CUT=3Dy
> -CONFIG_DD=3Dy
> -CONFIG_FEATURE_DD_SIGNAL_HANDLING=3Dy
> -# CONFIG_FEATURE_DD_THIRD_STATUS_LINE is not set
> -CONFIG_FEATURE_DD_IBS_OBS=3Dy
> -CONFIG_DF=3Dy
> -# CONFIG_FEATURE_DF_FANCY is not set
> -CONFIG_DIRNAME=3Dy
> -# CONFIG_DOS2UNIX is not set
> -# CONFIG_UNIX2DOS is not set
> -CONFIG_DU=3Dy
> -CONFIG_FEATURE_DU_DEFAULT_BLOCKSIZE_1K=3Dy
> -CONFIG_ECHO=3Dy
> -CONFIG_FEATURE_FANCY_ECHO=3Dy
> -CONFIG_ENV=3Dy
> -CONFIG_FEATURE_ENV_LONG_OPTIONS=3Dy
> -# CONFIG_EXPAND is not set
> -# CONFIG_FEATURE_EXPAND_LONG_OPTIONS is not set
> -CONFIG_EXPR=3Dy
> -CONFIG_EXPR_MATH_SUPPORT_64=3Dy
> -CONFIG_FALSE=3Dy
> -# CONFIG_FOLD is not set
> -# CONFIG_FSYNC is not set
> -CONFIG_HEAD=3Dy
> -CONFIG_FEATURE_FANCY_HEAD=3Dy
> -# CONFIG_HOSTID is not set
> -# CONFIG_INSTALL is not set
> -# CONFIG_FEATURE_INSTALL_LONG_OPTIONS is not set
> -CONFIG_LN=3Dy
> -CONFIG_LOGNAME=3Dy
> -CONFIG_LS=3Dy
> -CONFIG_FEATURE_LS_FILETYPES=3Dy
> -CONFIG_FEATURE_LS_FOLLOWLINKS=3Dy
> -CONFIG_FEATURE_LS_RECURSIVE=3Dy
> -CONFIG_FEATURE_LS_SORTFILES=3Dy
> -CONFIG_FEATURE_LS_TIMESTAMPS=3Dy
> -CONFIG_FEATURE_LS_USERNAME=3Dy
> -CONFIG_FEATURE_LS_COLOR=3Dy
> -# CONFIG_FEATURE_LS_COLOR_IS_DEFAULT is not set
> -CONFIG_MD5SUM=3Dy
> -CONFIG_MKDIR=3Dy
> -CONFIG_FEATURE_MKDIR_LONG_OPTIONS=3Dy
> -CONFIG_MKFIFO=3Dy
> -CONFIG_MKNOD=3Dy
> -CONFIG_MV=3Dy
> -# CONFIG_FEATURE_MV_LONG_OPTIONS is not set
> -CONFIG_NICE=3Dy
> -CONFIG_NOHUP=3Dy
> -CONFIG_OD=3Dy
> -# CONFIG_PRINTENV is not set
> -CONFIG_PRINTF=3Dy
> -CONFIG_PWD=3Dy
> -CONFIG_READLINK=3Dy
> -CONFIG_FEATURE_READLINK_FOLLOW=3Dy
> -CONFIG_REALPATH=3Dy
> -CONFIG_RM=3Dy
> -CONFIG_RMDIR=3Dy
> -# CONFIG_FEATURE_RMDIR_LONG_OPTIONS is not set
> -CONFIG_SEQ=3Dy
> -# CONFIG_SHA1SUM is not set
> -# CONFIG_SHA256SUM is not set
> -# CONFIG_SHA512SUM is not set
> -CONFIG_SLEEP=3Dy
> -CONFIG_FEATURE_FANCY_SLEEP=3Dy
> -# CONFIG_FEATURE_FLOAT_SLEEP is not set
> -CONFIG_SORT=3Dy
> -CONFIG_FEATURE_SORT_BIG=3Dy
> -# CONFIG_SPLIT is not set
> -# CONFIG_FEATURE_SPLIT_FANCY is not set
> -CONFIG_STAT=3Dy
> -CONFIG_FEATURE_STAT_FORMAT=3Dy
> -CONFIG_STTY=3Dy
> -# CONFIG_SUM is not set
> -CONFIG_SYNC=3Dy
> -# CONFIG_TAC is not set
> -CONFIG_TAIL=3Dy
> -CONFIG_FEATURE_FANCY_TAIL=3Dy
> -CONFIG_TEE=3Dy
> -# CONFIG_FEATURE_TEE_USE_BLOCK_IO is not set
> -CONFIG_TRUE=3Dy
> -CONFIG_TTY=3Dy
> -CONFIG_UNAME=3Dy
> -# CONFIG_UNEXPAND is not set
> -# CONFIG_FEATURE_UNEXPAND_LONG_OPTIONS is not set
> -CONFIG_UNIQ=3Dy
> -CONFIG_USLEEP=3Dy
> -CONFIG_UUDECODE=3Dy
> -CONFIG_UUENCODE=3Dy
> -CONFIG_WC=3Dy
> -# CONFIG_FEATURE_WC_LARGE is not set
> -CONFIG_WHOAMI=3Dy
> -CONFIG_YES=3Dy
> -
> -#
> -# Common options for cp and mv
> -#
> -# CONFIG_FEATURE_PRESERVE_HARDLINKS is not set
> -
> -#
> -# Common options for ls, more and telnet
> -#
> -CONFIG_FEATURE_AUTOWIDTH=3Dy
> -
> -#
> -# Common options for df, du, ls
> -#
> -CONFIG_FEATURE_HUMAN_READABLE=3Dy
> -
> -#
> -# Common options for md5sum, sha1sum, sha256sum, sha512sum
> -#
> -CONFIG_FEATURE_MD5_SHA1_SUM_CHECK=3Dy
> -
> -#
> -# Console Utilities
> -#
> -CONFIG_CHVT=3Dy
> -# CONFIG_FGCONSOLE is not set
> -CONFIG_CLEAR=3Dy
> -CONFIG_DEALLOCVT=3Dy
> -CONFIG_DUMPKMAP=3Dy
> -# CONFIG_KBD_MODE is not set
> -CONFIG_LOADFONT=3Dy
> -CONFIG_LOADKMAP=3Dy
> -CONFIG_OPENVT=3Dy
> -CONFIG_RESET=3Dy
> -# CONFIG_RESIZE is not set
> -# CONFIG_FEATURE_RESIZE_PRINT is not set
> -CONFIG_SETCONSOLE=3Dy
> -# CONFIG_FEATURE_SETCONSOLE_LONG_OPTIONS is not set
> -# CONFIG_SETFONT is not set
> -# CONFIG_FEATURE_SETFONT_TEXTUAL_MAP is not set
> -CONFIG_DEFAULT_SETFONT_DIR=3D""
> -# CONFIG_SETKEYCODES is not set
> -# CONFIG_SETLOGCONS is not set
> -# CONFIG_SHOWKEY is not set
> -
> -#
> -# Common options for loadfont and setfont
> -#
> -# CONFIG_FEATURE_LOADFONT_PSF2 is not set
> -# CONFIG_FEATURE_LOADFONT_RAW is not set
> -
> -#
> -# Debian Utilities
> -#
> -CONFIG_MKTEMP=3Dy
> -# CONFIG_PIPE_PROGRESS is not set
> -CONFIG_RUN_PARTS=3Dy
> -CONFIG_FEATURE_RUN_PARTS_LONG_OPTIONS=3Dy
> -# CONFIG_FEATURE_RUN_PARTS_FANCY is not set
> -CONFIG_START_STOP_DAEMON=3Dy
> -CONFIG_FEATURE_START_STOP_DAEMON_FANCY=3Dy
> -CONFIG_FEATURE_START_STOP_DAEMON_LONG_OPTIONS=3Dy
> -CONFIG_WHICH=3Dy
> -
> -#
> -# Editors
> -#
> -CONFIG_PATCH=3Dy
> -CONFIG_VI=3Dy
> -CONFIG_FEATURE_VI_MAX_LEN=3D1024
> -CONFIG_FEATURE_VI_8BIT=3Dy
> -CONFIG_FEATURE_VI_COLON=3Dy
> -CONFIG_FEATURE_VI_YANKMARK=3Dy
> -CONFIG_FEATURE_VI_SEARCH=3Dy
> -# CONFIG_FEATURE_VI_REGEX_SEARCH is not set
> -CONFIG_FEATURE_VI_USE_SIGNALS=3Dy
> -# CONFIG_FEATURE_VI_DOT_CMD is not set
> -# CONFIG_FEATURE_VI_READONLY is not set
> -# CONFIG_FEATURE_VI_SETOPTS is not set
> -# CONFIG_FEATURE_VI_SET is not set
> -CONFIG_FEATURE_VI_WIN_RESIZE=3Dy
> -# CONFIG_FEATURE_VI_ASK_TERMINAL is not set
> -CONFIG_FEATURE_VI_OPTIMIZE_CURSOR=3Dy
> -CONFIG_AWK=3Dy
> -# CONFIG_FEATURE_AWK_LIBM is not set
> -CONFIG_CMP=3Dy
> -CONFIG_DIFF=3Dy
> -# CONFIG_FEATURE_DIFF_LONG_OPTIONS is not set
> -CONFIG_FEATURE_DIFF_DIR=3Dy
> -# CONFIG_ED is not set
> -CONFIG_SED=3Dy
> -CONFIG_FEATURE_ALLOW_EXEC=3Dy
> -
> -#
> -# Finding Utilities
> -#
> -CONFIG_FIND=3Dy
> -CONFIG_FEATURE_FIND_PRINT0=3Dy
> -CONFIG_FEATURE_FIND_MTIME=3Dy
> -CONFIG_FEATURE_FIND_MMIN=3Dy
> -CONFIG_FEATURE_FIND_PERM=3Dy
> -CONFIG_FEATURE_FIND_TYPE=3Dy
> -CONFIG_FEATURE_FIND_XDEV=3Dy
> -CONFIG_FEATURE_FIND_MAXDEPTH=3Dy
> -CONFIG_FEATURE_FIND_NEWER=3Dy
> -# CONFIG_FEATURE_FIND_INUM is not set
> -CONFIG_FEATURE_FIND_EXEC=3Dy
> -CONFIG_FEATURE_FIND_USER=3Dy
> -CONFIG_FEATURE_FIND_GROUP=3Dy
> -CONFIG_FEATURE_FIND_NOT=3Dy
> -CONFIG_FEATURE_FIND_DEPTH=3Dy
> -CONFIG_FEATURE_FIND_PAREN=3Dy
> -CONFIG_FEATURE_FIND_SIZE=3Dy
> -CONFIG_FEATURE_FIND_PRUNE=3Dy
> -# CONFIG_FEATURE_FIND_DELETE is not set
> -CONFIG_FEATURE_FIND_PATH=3Dy
> -CONFIG_FEATURE_FIND_REGEX=3Dy
> -# CONFIG_FEATURE_FIND_CONTEXT is not set
> -# CONFIG_FEATURE_FIND_LINKS is not set
> -CONFIG_GREP=3Dy
> -CONFIG_FEATURE_GREP_EGREP_ALIAS=3Dy
> -CONFIG_FEATURE_GREP_FGREP_ALIAS=3Dy
> -CONFIG_FEATURE_GREP_CONTEXT=3Dy
> -CONFIG_XARGS=3Dy
> -# CONFIG_FEATURE_XARGS_SUPPORT_CONFIRMATION is not set
> -# CONFIG_FEATURE_XARGS_SUPPORT_QUOTES is not set
> -# CONFIG_FEATURE_XARGS_SUPPORT_TERMOPT is not set
> -# CONFIG_FEATURE_XARGS_SUPPORT_ZERO_TERM is not set
> -
> -#
> -# Init Utilities
> -#
> -# CONFIG_BOOTCHARTD is not set
> -# CONFIG_FEATURE_BOOTCHARTD_BLOATED_HEADER is not set
> -# CONFIG_FEATURE_BOOTCHARTD_CONFIG_FILE is not set
> -CONFIG_HALT=3Dy
> -# CONFIG_FEATURE_CALL_TELINIT is not set
> -CONFIG_TELINIT_PATH=3D""
> -# CONFIG_INIT is not set
> -# CONFIG_FEATURE_USE_INITTAB is not set
> -# CONFIG_FEATURE_KILL_REMOVED is not set
> -CONFIG_FEATURE_KILL_DELAY=3D0
> -# CONFIG_FEATURE_INIT_SCTTY is not set
> -# CONFIG_FEATURE_INIT_SYSLOG is not set
> -# CONFIG_FEATURE_EXTRA_QUIET is not set
> -# CONFIG_FEATURE_INIT_COREDUMPS is not set
> -# CONFIG_FEATURE_INITRD is not set
> -CONFIG_INIT_TERMINAL_TYPE=3D""
> -# CONFIG_MESG is not set
> -# CONFIG_FEATURE_MESG_ENABLE_ONLY_GROUP is not set
> -
> -#
> -# Login/Password Management Utilities
> -#
> -# CONFIG_ADD_SHELL is not set
> -# CONFIG_REMOVE_SHELL is not set
> -# CONFIG_FEATURE_SHADOWPASSWDS is not set
> -# CONFIG_USE_BB_PWD_GRP is not set
> -# CONFIG_USE_BB_SHADOW is not set
> -CONFIG_USE_BB_CRYPT=3Dy
> -# CONFIG_USE_BB_CRYPT_SHA is not set
> -# CONFIG_ADDUSER is not set
> -# CONFIG_FEATURE_ADDUSER_LONG_OPTIONS is not set
> -# CONFIG_FEATURE_CHECK_NAMES is not set
> -CONFIG_FIRST_SYSTEM_ID=3D100
> -CONFIG_LAST_SYSTEM_ID=3D999
> -# CONFIG_ADDGROUP is not set
> -# CONFIG_FEATURE_ADDGROUP_LONG_OPTIONS is not set
> -# CONFIG_FEATURE_ADDUSER_TO_GROUP is not set
> -# CONFIG_DELUSER is not set
> -# CONFIG_DELGROUP is not set
> -# CONFIG_FEATURE_DEL_USER_FROM_GROUP is not set
> -# CONFIG_GETTY is not set
> -# CONFIG_LOGIN is not set
> -# CONFIG_PAM is not set
> -# CONFIG_LOGIN_SCRIPTS is not set
> -# CONFIG_FEATURE_NOLOGIN is not set
> -# CONFIG_FEATURE_SECURETTY is not set
> -# CONFIG_PASSWD is not set
> -# CONFIG_FEATURE_PASSWD_WEAK_CHECK is not set
> -# CONFIG_CRYPTPW is not set
> -# CONFIG_CHPASSWD is not set
> -# CONFIG_SU is not set
> -# CONFIG_FEATURE_SU_SYSLOG is not set
> -# CONFIG_FEATURE_SU_CHECKS_SHELLS is not set
> -# CONFIG_SULOGIN is not set
> -# CONFIG_VLOCK is not set
> -
> -#
> -# Linux Ext2 FS Progs
> -#
> -CONFIG_CHATTR=3Dy
> -CONFIG_FSCK=3Dy
> -# CONFIG_LSATTR is not set
> -# CONFIG_TUNE2FS is not set
> -
> -#
> -# Linux Module Utilities
> -#
> -# CONFIG_MODINFO is not set
> -# CONFIG_MODPROBE_SMALL is not set
> -# CONFIG_FEATURE_MODPROBE_SMALL_OPTIONS_ON_CMDLINE is not set
> -# CONFIG_FEATURE_MODPROBE_SMALL_CHECK_ALREADY_LOADED is not set
> -CONFIG_INSMOD=3Dy
> -CONFIG_RMMOD=3Dy
> -CONFIG_LSMOD=3Dy
> -# CONFIG_FEATURE_LSMOD_PRETTY_2_6_OUTPUT is not set
> -CONFIG_MODPROBE=3Dy
> -# CONFIG_FEATURE_MODPROBE_BLACKLIST is not set
> -# CONFIG_DEPMOD is not set
> -
> -#
> -# Options common to multiple modutils
> -#
> -# CONFIG_FEATURE_2_4_MODULES is not set
> -# CONFIG_FEATURE_INSMOD_TRY_MMAP is not set
> -# CONFIG_FEATURE_INSMOD_VERSION_CHECKING is not set
> -# CONFIG_FEATURE_INSMOD_KSYMOOPS_SYMBOLS is not set
> -# CONFIG_FEATURE_INSMOD_LOADINKMEM is not set
> -# CONFIG_FEATURE_INSMOD_LOAD_MAP is not set
> -# CONFIG_FEATURE_INSMOD_LOAD_MAP_FULL is not set
> -CONFIG_FEATURE_CHECK_TAINTED_MODULE=3Dy
> -CONFIG_FEATURE_MODUTILS_ALIAS=3Dy
> -CONFIG_FEATURE_MODUTILS_SYMBOLS=3Dy
> -CONFIG_DEFAULT_MODULES_DIR=3D"/lib/modules"
> -CONFIG_DEFAULT_DEPMOD_FILE=3D"modules.dep"
> -
> -#
> -# Linux System Utilities
> -#
> -# CONFIG_BLOCKDEV is not set
> -CONFIG_REV=3Dy
> -# CONFIG_ACPID is not set
> -# CONFIG_FEATURE_ACPID_COMPAT is not set
> -# CONFIG_BLKID is not set
> -# CONFIG_FEATURE_BLKID_TYPE is not set
> -CONFIG_DMESG=3Dy
> -CONFIG_FEATURE_DMESG_PRETTY=3Dy
> -CONFIG_FBSET=3Dy
> -CONFIG_FEATURE_FBSET_FANCY=3Dy
> -CONFIG_FEATURE_FBSET_READMODE=3Dy
> -# CONFIG_FDFLUSH is not set
> -# CONFIG_FDFORMAT is not set
> -CONFIG_FDISK=3Dy
> -# CONFIG_FDISK_SUPPORT_LARGE_DISKS is not set
> -CONFIG_FEATURE_FDISK_WRITABLE=3Dy
> -# CONFIG_FEATURE_AIX_LABEL is not set
> -# CONFIG_FEATURE_SGI_LABEL is not set
> -# CONFIG_FEATURE_SUN_LABEL is not set
> -# CONFIG_FEATURE_OSF_LABEL is not set
> -# CONFIG_FEATURE_GPT_LABEL is not set
> -# CONFIG_FEATURE_FDISK_ADVANCED is not set
> -# CONFIG_FINDFS is not set
> -CONFIG_FLOCK=3Dy
> -# CONFIG_FREERAMDISK is not set
> -CONFIG_FSCK_MINIX=3Dy
> -# CONFIG_MKFS_EXT2 is not set
> -CONFIG_MKFS_MINIX=3Dy
> -CONFIG_FEATURE_MINIX2=3Dy
> -# CONFIG_MKFS_REISER is not set
> -# CONFIG_MKFS_VFAT is not set
> -# CONFIG_GETOPT is not set
> -# CONFIG_FEATURE_GETOPT_LONG is not set
> -CONFIG_HEXDUMP=3Dy
> -# CONFIG_FEATURE_HEXDUMP_REVERSE is not set
> -# CONFIG_HD is not set
> -CONFIG_HWCLOCK=3Dy
> -CONFIG_FEATURE_HWCLOCK_LONG_OPTIONS=3Dy
> -CONFIG_FEATURE_HWCLOCK_ADJTIME_FHS=3Dy
> -# CONFIG_IPCRM is not set
> -# CONFIG_IPCS is not set
> -CONFIG_LOSETUP=3Dy
> -# CONFIG_LSPCI is not set
> -# CONFIG_LSUSB is not set
> -# CONFIG_MDEV is not set
> -# CONFIG_FEATURE_MDEV_CONF is not set
> -# CONFIG_FEATURE_MDEV_RENAME is not set
> -# CONFIG_FEATURE_MDEV_RENAME_REGEXP is not set
> -# CONFIG_FEATURE_MDEV_EXEC is not set
> -# CONFIG_FEATURE_MDEV_LOAD_FIRMWARE is not set
> -CONFIG_MKSWAP=3Dy
> -# CONFIG_FEATURE_MKSWAP_UUID is not set
> -CONFIG_MORE=3Dy
> -CONFIG_MOUNT=3Dy
> -# CONFIG_FEATURE_MOUNT_FAKE is not set
> -# CONFIG_FEATURE_MOUNT_VERBOSE is not set
> -# CONFIG_FEATURE_MOUNT_HELPERS is not set
> -# CONFIG_FEATURE_MOUNT_LABEL is not set
> -# CONFIG_FEATURE_MOUNT_NFS is not set
> -# CONFIG_FEATURE_MOUNT_CIFS is not set
> -CONFIG_FEATURE_MOUNT_FLAGS=3Dy
> -CONFIG_FEATURE_MOUNT_FSTAB=3Dy
> -CONFIG_PIVOT_ROOT=3Dy
> -CONFIG_RDATE=3Dy
> -# CONFIG_RDEV is not set
> -# CONFIG_READPROFILE is not set
> -# CONFIG_RTCWAKE is not set
> -# CONFIG_SCRIPT is not set
> -# CONFIG_SCRIPTREPLAY is not set
> -# CONFIG_SETARCH is not set
> -CONFIG_SWAPONOFF=3Dy
> -# CONFIG_FEATURE_SWAPON_PRI is not set
> -CONFIG_SWITCH_ROOT=3Dy
> -CONFIG_UMOUNT=3Dy
> -CONFIG_FEATURE_UMOUNT_ALL=3Dy
> -
> -#
> -# Common options for mount/umount
> -#
> -CONFIG_FEATURE_MOUNT_LOOP=3Dy
> -CONFIG_FEATURE_MOUNT_LOOP_CREATE=3Dy
> -# CONFIG_FEATURE_MTAB_SUPPORT is not set
> -# CONFIG_VOLUMEID is not set
> -# CONFIG_FEATURE_VOLUMEID_EXT is not set
> -# CONFIG_FEATURE_VOLUMEID_BTRFS is not set
> -# CONFIG_FEATURE_VOLUMEID_REISERFS is not set
> -# CONFIG_FEATURE_VOLUMEID_FAT is not set
> -# CONFIG_FEATURE_VOLUMEID_HFS is not set
> -# CONFIG_FEATURE_VOLUMEID_JFS is not set
> -# CONFIG_FEATURE_VOLUMEID_XFS is not set
> -# CONFIG_FEATURE_VOLUMEID_NTFS is not set
> -# CONFIG_FEATURE_VOLUMEID_ISO9660 is not set
> -# CONFIG_FEATURE_VOLUMEID_UDF is not set
> -# CONFIG_FEATURE_VOLUMEID_LUKS is not set
> -# CONFIG_FEATURE_VOLUMEID_LINUXSWAP is not set
> -# CONFIG_FEATURE_VOLUMEID_CRAMFS is not set
> -# CONFIG_FEATURE_VOLUMEID_ROMFS is not set
> -# CONFIG_FEATURE_VOLUMEID_SYSV is not set
> -# CONFIG_FEATURE_VOLUMEID_OCFS2 is not set
> -# CONFIG_FEATURE_VOLUMEID_LINUXRAID is not set
> -
> -#
> -# Miscellaneous Utilities
> -#
> -# CONFIG_CONSPY is not set
> -CONFIG_LESS=3Dy
> -CONFIG_FEATURE_LESS_MAXLINES=3D9999999
> -CONFIG_FEATURE_LESS_BRACKETS=3Dy
> -CONFIG_FEATURE_LESS_FLAGS=3Dy
> -# CONFIG_FEATURE_LESS_MARKS is not set
> -# CONFIG_FEATURE_LESS_REGEXP is not set
> -# CONFIG_FEATURE_LESS_WINCH is not set
> -# CONFIG_FEATURE_LESS_ASK_TERMINAL is not set
> -# CONFIG_FEATURE_LESS_DASHCMD is not set
> -# CONFIG_FEATURE_LESS_LINENUMS is not set
> -# CONFIG_NANDWRITE is not set
> -# CONFIG_NANDDUMP is not set
> -# CONFIG_SETSERIAL is not set
> -# CONFIG_UBIATTACH is not set
> -# CONFIG_UBIDETACH is not set
> -# CONFIG_UBIMKVOL is not set
> -# CONFIG_UBIRMVOL is not set
> -# CONFIG_UBIRSVOL is not set
> -# CONFIG_UBIUPDATEVOL is not set
> -# CONFIG_ADJTIMEX is not set
> -# CONFIG_BBCONFIG is not set
> -# CONFIG_FEATURE_COMPRESS_BBCONFIG is not set
> -# CONFIG_BEEP is not set
> -CONFIG_FEATURE_BEEP_FREQ=3D0
> -CONFIG_FEATURE_BEEP_LENGTH_MS=3D0
> -# CONFIG_CHAT is not set
> -# CONFIG_FEATURE_CHAT_NOFAIL is not set
> -# CONFIG_FEATURE_CHAT_TTY_HIFI is not set
> -# CONFIG_FEATURE_CHAT_IMPLICIT_CR is not set
> -# CONFIG_FEATURE_CHAT_SWALLOW_OPTS is not set
> -# CONFIG_FEATURE_CHAT_SEND_ESCAPES is not set
> -# CONFIG_FEATURE_CHAT_VAR_ABORT_LEN is not set
> -# CONFIG_FEATURE_CHAT_CLR_ABORT is not set
> -CONFIG_CHRT=3Dy
> -# CONFIG_CROND is not set
> -# CONFIG_FEATURE_CROND_D is not set
> -# CONFIG_FEATURE_CROND_CALL_SENDMAIL is not set
> -CONFIG_FEATURE_CROND_DIR=3D""
> -# CONFIG_CRONTAB is not set
> -CONFIG_DC=3Dy
> -# CONFIG_FEATURE_DC_LIBM is not set
> -# CONFIG_DEVFSD is not set
> -# CONFIG_DEVFSD_MODLOAD is not set
> -# CONFIG_DEVFSD_FG_NP is not set
> -# CONFIG_DEVFSD_VERBOSE is not set
> -# CONFIG_FEATURE_DEVFS is not set
> -# CONFIG_DEVMEM is not set
> -# CONFIG_EJECT is not set
> -# CONFIG_FEATURE_EJECT_SCSI is not set
> -# CONFIG_FBSPLASH is not set
> -# CONFIG_FLASHCP is not set
> -# CONFIG_FLASH_LOCK is not set
> -# CONFIG_FLASH_UNLOCK is not set
> -# CONFIG_FLASH_ERASEALL is not set
> -# CONFIG_IONICE is not set
> -# CONFIG_INOTIFYD is not set
> -# CONFIG_LAST is not set
> -# CONFIG_FEATURE_LAST_SMALL is not set
> -# CONFIG_FEATURE_LAST_FANCY is not set
> -# CONFIG_HDPARM is not set
> -# CONFIG_FEATURE_HDPARM_GET_IDENTITY is not set
> -# CONFIG_FEATURE_HDPARM_HDIO_SCAN_HWIF is not set
> -# CONFIG_FEATURE_HDPARM_HDIO_UNREGISTER_HWIF is not set
> -# CONFIG_FEATURE_HDPARM_HDIO_DRIVE_RESET is not set
> -# CONFIG_FEATURE_HDPARM_HDIO_TRISTATE_HWIF is not set
> -# CONFIG_FEATURE_HDPARM_HDIO_GETSET_DMA is not set
> -# CONFIG_MAKEDEVS is not set
> -# CONFIG_FEATURE_MAKEDEVS_LEAF is not set
> -# CONFIG_FEATURE_MAKEDEVS_TABLE is not set
> -# CONFIG_MAN is not set
> -CONFIG_MICROCOM=3Dy
> -# CONFIG_MOUNTPOINT is not set
> -# CONFIG_MT is not set
> -# CONFIG_RAIDAUTORUN is not set
> -# CONFIG_READAHEAD is not set
> -# CONFIG_RFKILL is not set
> -# CONFIG_RUNLEVEL is not set
> -# CONFIG_RX is not set
> -CONFIG_SETSID=3Dy
> -CONFIG_STRINGS=3Dy
> -CONFIG_TASKSET=3Dy
> -CONFIG_FEATURE_TASKSET_FANCY=3Dy
> -CONFIG_TIME=3Dy
> -CONFIG_TIMEOUT=3Dy
> -# CONFIG_TTYSIZE is not set
> -# CONFIG_VOLNAME is not set
> -# CONFIG_WALL is not set
> -# CONFIG_WATCHDOG is not set
> -
> -#
> -# Networking Utilities
> -#
> -# CONFIG_NAMEIF is not set
> -# CONFIG_FEATURE_NAMEIF_EXTENDED is not set
> -# CONFIG_NBDCLIENT is not set
> -CONFIG_NC=3Dy
> -# CONFIG_NC_SERVER is not set
> -# CONFIG_NC_EXTRA is not set
> -# CONFIG_NC_110_COMPAT is not set
> -CONFIG_PING=3Dy
> -CONFIG_PING6=3Dy
> -CONFIG_FEATURE_FANCY_PING=3Dy
> -# CONFIG_WHOIS is not set
> -CONFIG_FEATURE_IPV6=3Dy
> -# CONFIG_FEATURE_UNIX_LOCAL is not set
> -CONFIG_FEATURE_PREFER_IPV4_ADDRESS=3Dy
> -# CONFIG_VERBOSE_RESOLUTION_ERRORS is not set
> -CONFIG_ARP=3Dy
> -CONFIG_ARPING=3Dy
> -CONFIG_BRCTL=3Dy
> -CONFIG_FEATURE_BRCTL_FANCY=3Dy
> -CONFIG_FEATURE_BRCTL_SHOW=3Dy
> -# CONFIG_DNSD is not set
> -# CONFIG_ETHER_WAKE is not set
> -# CONFIG_FAKEIDENTD is not set
> -# CONFIG_FTPD is not set
> -# CONFIG_FEATURE_FTP_WRITE is not set
> -# CONFIG_FEATURE_FTPD_ACCEPT_BROKEN_LIST is not set
> -# CONFIG_FTPGET is not set
> -# CONFIG_FTPPUT is not set
> -# CONFIG_FEATURE_FTPGETPUT_LONG_OPTIONS is not set
> -CONFIG_HOSTNAME=3Dy
> -CONFIG_HTTPD=3Dy
> -# CONFIG_FEATURE_HTTPD_RANGES is not set
> -# CONFIG_FEATURE_HTTPD_USE_SENDFILE is not set
> -# CONFIG_FEATURE_HTTPD_SETUID is not set
> -# CONFIG_FEATURE_HTTPD_BASIC_AUTH is not set
> -# CONFIG_FEATURE_HTTPD_AUTH_MD5 is not set
> -# CONFIG_FEATURE_HTTPD_CGI is not set
> -# CONFIG_FEATURE_HTTPD_CONFIG_WITH_SCRIPT_INTERPR is not set
> -# CONFIG_FEATURE_HTTPD_SET_REMOTE_PORT_TO_ENV is not set
> -# CONFIG_FEATURE_HTTPD_ENCODE_URL_STR is not set
> -# CONFIG_FEATURE_HTTPD_ERROR_PAGES is not set
> -# CONFIG_FEATURE_HTTPD_PROXY is not set
> -# CONFIG_FEATURE_HTTPD_GZIP is not set
> -CONFIG_IFCONFIG=3Dy
> -CONFIG_FEATURE_IFCONFIG_STATUS=3Dy
> -# CONFIG_FEATURE_IFCONFIG_SLIP is not set
> -# CONFIG_FEATURE_IFCONFIG_MEMSTART_IOADDR_IRQ is not set
> -CONFIG_FEATURE_IFCONFIG_HW=3Dy
> -# CONFIG_FEATURE_IFCONFIG_BROADCAST_PLUS is not set
> -# CONFIG_IFENSLAVE is not set
> -# CONFIG_IFPLUGD is not set
> -CONFIG_IFUPDOWN=3Dy
> -CONFIG_IFUPDOWN_IFSTATE_PATH=3D"/var/run/ifstate"
> -# CONFIG_FEATURE_IFUPDOWN_IP is not set
> -# CONFIG_FEATURE_IFUPDOWN_IP_BUILTIN is not set
> -CONFIG_FEATURE_IFUPDOWN_IFCONFIG_BUILTIN=3Dy
> -CONFIG_FEATURE_IFUPDOWN_IPV4=3Dy
> -CONFIG_FEATURE_IFUPDOWN_IPV6=3Dy
> -CONFIG_FEATURE_IFUPDOWN_MAPPING=3Dy
> -# CONFIG_FEATURE_IFUPDOWN_EXTERNAL_DHCP is not set
> -CONFIG_INETD=3Dy
> -CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_ECHO=3Dy
> -CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DISCARD=3Dy
> -CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_TIME=3Dy
> -CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DAYTIME=3Dy
> -CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_CHARGEN=3Dy
> -# CONFIG_FEATURE_INETD_RPC is not set
> -CONFIG_IP=3Dy
> -CONFIG_FEATURE_IP_ADDRESS=3Dy
> -CONFIG_FEATURE_IP_LINK=3Dy
> -CONFIG_FEATURE_IP_ROUTE=3Dy
> -CONFIG_FEATURE_IP_TUNNEL=3Dy
> -# CONFIG_FEATURE_IP_RULE is not set
> -# CONFIG_FEATURE_IP_SHORT_FORMS is not set
> -# CONFIG_FEATURE_IP_RARE_PROTOCOLS is not set
> -# CONFIG_IPADDR is not set
> -# CONFIG_IPLINK is not set
> -# CONFIG_IPROUTE is not set
> -# CONFIG_IPTUNNEL is not set
> -# CONFIG_IPRULE is not set
> -# CONFIG_IPCALC is not set
> -# CONFIG_FEATURE_IPCALC_FANCY is not set
> -# CONFIG_FEATURE_IPCALC_LONG_OPTIONS is not set
> -CONFIG_NETSTAT=3Dy
> -# CONFIG_FEATURE_NETSTAT_WIDE is not set
> -# CONFIG_FEATURE_NETSTAT_PRG is not set
> -CONFIG_NSLOOKUP=3Dy
> -# CONFIG_NTPD is not set
> -# CONFIG_FEATURE_NTPD_SERVER is not set
> -# CONFIG_PSCAN is not set
> -CONFIG_ROUTE=3Dy
> -# CONFIG_SLATTACH is not set
> -CONFIG_TCPSVD=3Dy
> -# CONFIG_TC is not set
> -CONFIG_TELNET=3Dy
> -# CONFIG_FEATURE_TELNET_TTYPE is not set
> -CONFIG_FEATURE_TELNET_AUTOLOGIN=3Dy
> -CONFIG_TELNETD=3Dy
> -CONFIG_FEATURE_TELNETD_STANDALONE=3Dy
> -# CONFIG_FEATURE_TELNETD_INETD_WAIT is not set
> -CONFIG_TFTP=3Dy
> -CONFIG_TFTPD=3Dy
> -
> -#
> -# Common options for tftp/tftpd
> -#
> -CONFIG_FEATURE_TFTP_GET=3Dy
> -CONFIG_FEATURE_TFTP_PUT=3Dy
> -CONFIG_FEATURE_TFTP_BLOCKSIZE=3Dy
> -# CONFIG_FEATURE_TFTP_PROGRESS_BAR is not set
> -# CONFIG_TFTP_DEBUG is not set
> -CONFIG_TRACEROUTE=3Dy
> -# CONFIG_TRACEROUTE6 is not set
> -# CONFIG_FEATURE_TRACEROUTE_VERBOSE is not set
> -# CONFIG_FEATURE_TRACEROUTE_SOURCE_ROUTE is not set
> -# CONFIG_FEATURE_TRACEROUTE_USE_ICMP is not set
> -# CONFIG_TUNCTL is not set
> -# CONFIG_FEATURE_TUNCTL_UG is not set
> -CONFIG_UDHCPD=3Dy
> -# CONFIG_DHCPRELAY is not set
> -CONFIG_DUMPLEASES=3Dy
> -# CONFIG_FEATURE_UDHCPD_WRITE_LEASES_EARLY is not set
> -# CONFIG_FEATURE_UDHCPD_BASE_IP_ON_MAC is not set
> -CONFIG_DHCPD_LEASES_FILE=3D"/var/lib/misc/udhcpd.leases"
> -CONFIG_UDHCPC=3Dy
> -CONFIG_FEATURE_UDHCPC_ARPING=3Dy
> -# CONFIG_FEATURE_UDHCP_PORT is not set
> -CONFIG_UDHCP_DEBUG=3D0
> -# CONFIG_FEATURE_UDHCP_RFC3397 is not set
> -# CONFIG_FEATURE_UDHCP_8021Q is not set
> -CONFIG_UDHCPC_DEFAULT_SCRIPT=3D"/usr/share/udhcpc/default.script"
> -CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=3D80
> -CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS=3D""
> -CONFIG_UDPSVD=3Dy
> -CONFIG_VCONFIG=3Dy
> -CONFIG_WGET=3Dy
> -CONFIG_FEATURE_WGET_STATUSBAR=3Dy
> -CONFIG_FEATURE_WGET_AUTHENTICATION=3Dy
> -CONFIG_FEATURE_WGET_LONG_OPTIONS=3Dy
> -CONFIG_FEATURE_WGET_TIMEOUT=3Dy
> -# CONFIG_ZCIP is not set
> -
> -#
> -# Print Utilities
> -#
> -# CONFIG_LPD is not set
> -# CONFIG_LPR is not set
> -# CONFIG_LPQ is not set
> -
> -#
> -# Mail Utilities
> -#
> -# CONFIG_MAKEMIME is not set
> -CONFIG_FEATURE_MIME_CHARSET=3D""
> -# CONFIG_POPMAILDIR is not set
> -# CONFIG_FEATURE_POPMAILDIR_DELIVERY is not set
> -# CONFIG_REFORMIME is not set
> -# CONFIG_FEATURE_REFORMIME_COMPAT is not set
> -# CONFIG_SENDMAIL is not set
> -
> -#
> -# Process Utilities
> -#
> -# CONFIG_IOSTAT is not set
> -CONFIG_MPSTAT=3Dy
> -# CONFIG_NMETER is not set
> -# CONFIG_PMAP is not set
> -# CONFIG_POWERTOP is not set
> -# CONFIG_PSTREE is not set
> -# CONFIG_PWDX is not set
> -# CONFIG_SMEMCAP is not set
> -CONFIG_UPTIME=3Dy
> -# CONFIG_FEATURE_UPTIME_UTMP_SUPPORT is not set
> -CONFIG_FREE=3Dy
> -CONFIG_FUSER=3Dy
> -CONFIG_KILL=3Dy
> -CONFIG_KILLALL=3Dy
> -# CONFIG_KILLALL5 is not set
> -# CONFIG_PGREP is not set
> -CONFIG_PIDOF=3Dy
> -# CONFIG_FEATURE_PIDOF_SINGLE is not set
> -# CONFIG_FEATURE_PIDOF_OMIT is not set
> -# CONFIG_PKILL is not set
> -CONFIG_PS=3Dy
> -CONFIG_FEATURE_PS_WIDE=3Dy
> -CONFIG_FEATURE_PS_TIME=3Dy
> -CONFIG_FEATURE_PS_ADDITIONAL_COLUMNS=3Dy
> -# CONFIG_FEATURE_PS_UNUSUAL_SYSTEMS is not set
> -CONFIG_RENICE=3Dy
> -CONFIG_BB_SYSCTL=3Dy
> -CONFIG_TOP=3Dy
> -CONFIG_FEATURE_TOP_CPU_USAGE_PERCENTAGE=3Dy
> -CONFIG_FEATURE_TOP_CPU_GLOBAL_PERCENTS=3Dy
> -# CONFIG_FEATURE_TOP_SMP_CPU is not set
> -# CONFIG_FEATURE_TOP_DECIMALS is not set
> -# CONFIG_FEATURE_TOP_SMP_PROCESS is not set
> -# CONFIG_FEATURE_TOPMEM is not set
> -CONFIG_FEATURE_SHOW_THREADS=3Dy
> -CONFIG_WATCH=3Dy
> -
> -#
> -# Runit Utilities
> -#
> -# CONFIG_RUNSV is not set
> -# CONFIG_RUNSVDIR is not set
> -# CONFIG_FEATURE_RUNSVDIR_LOG is not set
> -# CONFIG_SV is not set
> -CONFIG_SV_DEFAULT_SERVICE_DIR=3D""
> -# CONFIG_SVLOGD is not set
> -# CONFIG_CHPST is not set
> -# CONFIG_SETUIDGID is not set
> -# CONFIG_ENVUIDGID is not set
> -# CONFIG_ENVDIR is not set
> -# CONFIG_SOFTLIMIT is not set
> -# CONFIG_CHCON is not set
> -# CONFIG_FEATURE_CHCON_LONG_OPTIONS is not set
> -# CONFIG_GETENFORCE is not set
> -# CONFIG_GETSEBOOL is not set
> -# CONFIG_LOAD_POLICY is not set
> -# CONFIG_MATCHPATHCON is not set
> -# CONFIG_RESTORECON is not set
> -# CONFIG_RUNCON is not set
> -# CONFIG_FEATURE_RUNCON_LONG_OPTIONS is not set
> -# CONFIG_SELINUXENABLED is not set
> -# CONFIG_SETENFORCE is not set
> -# CONFIG_SETFILES is not set
> -# CONFIG_FEATURE_SETFILES_CHECK_OPTION is not set
> -# CONFIG_SETSEBOOL is not set
> -# CONFIG_SESTATUS is not set
> -
> -#
> -# Shells
> -#
> -CONFIG_ASH=3Dy
> -CONFIG_ASH_BASH_COMPAT=3Dy
> -# CONFIG_ASH_IDLE_TIMEOUT is not set
> -CONFIG_ASH_JOB_CONTROL=3Dy
> -CONFIG_ASH_ALIAS=3Dy
> -CONFIG_ASH_GETOPTS=3Dy
> -CONFIG_ASH_BUILTIN_ECHO=3Dy
> -CONFIG_ASH_BUILTIN_PRINTF=3Dy
> -CONFIG_ASH_BUILTIN_TEST=3Dy
> -# CONFIG_ASH_CMDCMD is not set
> -# CONFIG_ASH_MAIL is not set
> -CONFIG_ASH_OPTIMIZE_FOR_SIZE=3Dy
> -# CONFIG_ASH_RANDOM_SUPPORT is not set
> -CONFIG_ASH_EXPAND_PRMT=3Dy
> -# CONFIG_CTTYHACK is not set
> -# CONFIG_HUSH is not set
> -# CONFIG_HUSH_BASH_COMPAT is not set
> -# CONFIG_HUSH_BRACE_EXPANSION is not set
> -# CONFIG_HUSH_HELP is not set
> -# CONFIG_HUSH_INTERACTIVE is not set
> -# CONFIG_HUSH_SAVEHISTORY is not set
> -# CONFIG_HUSH_JOB is not set
> -# CONFIG_HUSH_TICK is not set
> -# CONFIG_HUSH_IF is not set
> -# CONFIG_HUSH_LOOPS is not set
> -# CONFIG_HUSH_CASE is not set
> -# CONFIG_HUSH_FUNCTIONS is not set
> -# CONFIG_HUSH_LOCAL is not set
> -# CONFIG_HUSH_RANDOM_SUPPORT is not set
> -# CONFIG_HUSH_EXPORT_N is not set
> -# CONFIG_HUSH_MODE_X is not set
> -# CONFIG_MSH is not set
> -CONFIG_FEATURE_SH_IS_ASH=3Dy
> -# CONFIG_FEATURE_SH_IS_HUSH is not set
> -# CONFIG_FEATURE_SH_IS_NONE is not set
> -# CONFIG_FEATURE_BASH_IS_ASH is not set
> -# CONFIG_FEATURE_BASH_IS_HUSH is not set
> -CONFIG_FEATURE_BASH_IS_NONE=3Dy
> -CONFIG_SH_MATH_SUPPORT=3Dy
> -# CONFIG_SH_MATH_SUPPORT_64 is not set
> -CONFIG_FEATURE_SH_EXTRA_QUIET=3Dy
> -# CONFIG_FEATURE_SH_STANDALONE is not set
> -# CONFIG_FEATURE_SH_NOFORK is not set
> -CONFIG_FEATURE_SH_HISTFILESIZE=3Dy
> -
> -#
> -# System Logging Utilities
> -#
> -CONFIG_SYSLOGD=3Dy
> -CONFIG_FEATURE_ROTATE_LOGFILE=3Dy
> -CONFIG_FEATURE_REMOTE_LOG=3Dy
> -CONFIG_FEATURE_SYSLOGD_DUP=3Dy
> -CONFIG_FEATURE_SYSLOGD_CFG=3Dy
> -CONFIG_FEATURE_SYSLOGD_READ_BUFFER_SIZE=3D256
> -CONFIG_FEATURE_IPC_SYSLOG=3Dy
> -CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=3D16
> -CONFIG_LOGREAD=3Dy
> -CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING=3Dy
> -CONFIG_KLOGD=3Dy
> -CONFIG_FEATURE_KLOGD_KLOGCTL=3Dy
> -CONFIG_LOGGER=3Dy
> diff --git a/meta-arago-distro/recipes-core/busybox/busybox/network.cfg=
 b/meta-arago-distro/recipes-core/busybox/busybox/network.cfg
> new file mode 100644
> index 00000000..57499a77
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/busybox/busybox/network.cfg
> @@ -0,0 +1,19 @@
> +CONFIG_INETD=3Dy
> +CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_ECHO=3Dy
> +CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DISCARD=3Dy
> +CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_TIME=3Dy
> +CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DAYTIME=3Dy
> +CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_CHARGEN=3Dy
> +CONFIG_TCPSVD=3Dy
> +CONFIG_TFTPD=3Dy
> +CONFIG_UDPSVD=3Dy
> +CONFIG_VCONFIG=3Dy
> +CONFIG_ARP=3Dy
> +CONFIG_ARPING=3Dy
> +CONFIG_BRCTL=3Dy
> +CONFIG_FEATURE_BRCTL_FANCY=3Dy
> +CONFIG_FEATURE_BRCTL_SHOW=3Dy
> +CONFIG_HTTPD=3Dy
> +CONFIG_TELNETD=3Dy
> +CONFIG_FEATURE_TELNETD_STANDALONE=3Dy
> +CONFIG_FEATURE_TFTP_BLOCKSIZE=3Dy
> diff --git a/meta-arago-distro/recipes-core/busybox/busybox/utils.cfg b=
/meta-arago-distro/recipes-core/busybox/busybox/utils.cfg
> new file mode 100644
> index 00000000..c020f638
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/busybox/busybox/utils.cfg
> @@ -0,0 +1,15 @@
> +CONFIG_CHRT=3Dy
> +CONFIG_FEATURE_DD_IBS_OBS=3Dy
> +CONFIG_FEATURE_FANCY_HEAD=3Dy
> +CONFIG_DPKG_DEB=3Dy
> +CONFIG_MPSTAT=3Dy
> +CONFIG_NICE=3Dy
> +CONFIG_FEATURE_PS_TIME=3Dy
> +CONFIG_FEATURE_PS_ADDITIONAL_COLUMNS=3Dy
> +CONFIG_TASKSET=3Dy
> +CONFIG_FEATURE_TASKSET_FANCY=3Dy
> +CONFIG_FEATURE_SHOW_THREADS=3Dy
> +CONFIG_TIMEOUT=3Dy
> +CONFIG_UUDECODE=3Dy
> +CONFIG_UUENCODE=3Dy
> +CONFIG_XZ=3Dy
> diff --git a/meta-arago-distro/recipes-core/busybox/busybox_%.bbappend =
b/meta-arago-distro/recipes-core/busybox/busybox_%.bbappend
> index 9b440aa3..15c27a34 100644
> --- a/meta-arago-distro/recipes-core/busybox/busybox_%.bbappend
> +++ b/meta-arago-distro/recipes-core/busybox/busybox_%.bbappend
> @@ -1,6 +1,8 @@
> -# look for files in this layer first
>   FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
>  =20
> -SRC_URI:append =3D " file://0001-rtcwake-Allow-poweroff-with-rtcwake-c=
ommand.patch "
> +SRC_URI +=3D " \
> +	file://network.cfg \
> +	file://utils.cfg \
> +"
>  =20
> -PR:append =3D ".arago21"
> +PR:append =3D ".arago22"
> --=20
> 2.25.1
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15333):https://urldefense.com/v3/__https://lists.yo=
ctoproject.org/g/meta-arago/message/15333__;!!G3vK!WZG6FVsy-gjBcdutTuQXp_=
CQ0TSM4PEbZ_pNpSx8Ueb1YsLcU0s-_asIvhsY_eE4Snge8kWJFX6v$
> Mute This Topic:https://urldefense.com/v3/__https://lists.yoctoproject.=
org/mt/106145694/7030289__;!!G3vK!WZG6FVsy-gjBcdutTuQXp_CQ0TSM4PEbZ_pNpSx=
8Ueb1YsLcU0s-_asIvhsY_eE4Snge8lUMSYI-$
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org/=
g/meta-arago/unsub__;!!G3vK!WZG6FVsy-gjBcdutTuQXp_CQ0TSM4PEbZ_pNpSx8Ueb1Y=
sLcU0s-_asIvhsY_eE4Snge8iq9LnqB$  [c-shilwant@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

