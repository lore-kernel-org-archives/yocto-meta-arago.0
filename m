Return-Path: <j-stiffler@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id AFE8F52A3A
	for <meta-arago@arago-project.org>;
	Thu, 12 Nov 2015 15:03:29 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id tACF3Ssg027472;
	Thu, 12 Nov 2015 09:03:29 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tACF3S9i010056;
	Thu, 12 Nov 2015 09:03:28 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 12 Nov 2015 09:03:29 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id tACF3SGE015696;
	Thu, 12 Nov 2015 09:03:28 -0600
Message-ID: <5644AA40.5030507@ti.com>
Date: Thu, 12 Nov 2015 10:03:28 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@arago-project.org>
References: <1447293885-4222-1-git-send-email-denis@denix.org>
In-Reply-To: <1447293885-4222-1-git-send-email-denis@denix.org>
Subject: Re: [PATCH] nativesdk-qtbase: drop locally applied patch that was upstreamed
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
X-List-Received-Date: Thu, 12 Nov 2015 15:03:30 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

In our configs, we have the meta-qt5 layer frozen at 
97ce05c0b2a81f05388d7f727741529fb9177775.

How will we get this upstream patch?

Thanks,
Jake

On 11/11/2015 9:04 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>   ...xpand-path-increase-change-to-2-more-path.patch | 28 ----------------------
>   .../recipes-qt/qt5/nativesdk-qtbase_%.bbappend     |  5 ----
>   2 files changed, 33 deletions(-)
>   delete mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0001-configure-expand-path-increase-change-to-2-more-path.patch
>   delete mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase_%.bbappend
>
> diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0001-configure-expand-path-increase-change-to-2-more-path.patch b/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0001-configure-expand-path-increase-change-to-2-more-path.patch
> deleted file mode 100644
> index fc54c64..0000000
> --- a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0001-configure-expand-path-increase-change-to-2-more-path.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From cfa358e04b9e7c66d59db3000b2a2ab2ebf543c8 Mon Sep 17 00:00:00 2001
> -From: Denys Dmytriyenko <denys@ti.com>
> -Date: Tue, 25 Aug 2015 11:26:48 -0400
> -Subject: [PATCH] configure: expand path increase change to 2 more paths
> -
> -Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ----
> - configure | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/configure b/configure
> -index bea14af..fe18487 100755
> ---- a/configure
> -+++ b/configure
> -@@ -3853,8 +3853,8 @@ static const char qt_configure_installation          [12+11]    = "qt_instdate=2
> - /* Installation Info */
> - static const char qt_configure_prefix_path_str       [512 + 12] = "qt_prfxpath=$QT_INSTALL_PREFIX";
> - #ifdef QT_BUILD_QMAKE
> --static const char qt_configure_ext_prefix_path_str   [256 + 12] = "qt_epfxpath=$QT_EXT_PREFIX";
> --static const char qt_configure_host_prefix_path_str  [256 + 12] = "qt_hpfxpath=$QT_HOST_PREFIX";
> -+static const char qt_configure_ext_prefix_path_str   [512 + 12] = "qt_epfxpath=$QT_EXT_PREFIX";
> -+static const char qt_configure_host_prefix_path_str  [512 + 12] = "qt_hpfxpath=$QT_HOST_PREFIX";
> - #endif
> -
> - static const short qt_configure_str_offsets[] = {
> ---
> -2.2.0
> -
> diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase_%.bbappend b/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase_%.bbappend
> deleted file mode 100644
> index 39f739a..0000000
> --- a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase_%.bbappend
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> -
> -SRC_URI += "file://0001-configure-expand-path-increase-change-to-2-more-path.patch"
> -
> -PR_append = "-arago0"


