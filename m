Return-Path: <karthik.ramanan@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 9673452987
	for <meta-arago@arago-project.org>;
	Mon, 27 Jul 2015 10:59:26 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t6RAxO5K004464
	for <meta-arago@arago-project.org>; Mon, 27 Jul 2015 05:59:25 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id t6RAxM9Q026368
	for <meta-arago@arago-project.org>; Mon, 27 Jul 2015 16:29:23 +0530
Received: from [172.24.158.136] (172.24.158.136) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Mon, 27 Jul 2015 16:29:21 +0530
Message-ID: <55B60F08.60902@ti.com>
Date: Mon, 27 Jul 2015 16:29:20 +0530
From: Karthik Ramanan <a0393906@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: <meta-arago@arago-project.org>
References: <1437992680-17958-1-git-send-email-a0393906@ti.com>
In-Reply-To: <1437992680-17958-1-git-send-email-a0393906@ti.com>
X-Originating-IP: [172.24.158.136]
Subject: Re: [daisy, master 1/2] gstreamer1.0-plugins-bad: recipe revamp and bug fixes
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
X-List-Received-Date: Mon, 27 Jul 2015 10:59:26 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On further thought, I think this applies only to daisy.
Please ignore the merge request into master.

On 27-Jul-15 3:54 PM, Karthik Ramanan wrote:
> The recipe update switches to a TI GLSDK hosted git repository.
> All the previously used private patches are updated on the git.
>
> The following bug fixes have been done:
>   * Modify parser to interpolate pts
>   * drm buffer pool:
>    * Improved to fix memory leak
>    * GstDRMBufferPool support fix
>   * waylandsink:
>    * Remove drm bufferpool instance to fix socket leaks
>    * Fix memleak due to unfreed hash-table
>    * Cleanup buffer in NULL state
>    * Enable mouse pointer movement
>    * Workaround partial frame delay artifacts
>    * Solve segmentation fault in drm_handle_format
>
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>   .../0001-Added-GstDRMBufferPool-support.patch      |  774 -----------
>   ...odified-waylandsink-to-accept-NV12-format.patch | 1017 --------------
>   .../0003-Added-KMSsink-support.patch               | 1457 --------------------
>   ...04-waylandsink-Removed-dependency-on-dri2.patch |   26 -
>   ...vc1parse-and-jpegparse-Fixes-plugin-ranks.patch |   54 -
>   .../0006-GstDRMBufferPool-support-fix.patch        |   36 -
>   .../gstreamer1.0-plugins-bad_1.2.3.bbappend        |   17 +-
>   7 files changed, 8 insertions(+), 3373 deletions(-)
>   delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Added-GstDRMBufferPool-support.patch
>   delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-Modified-waylandsink-to-accept-NV12-format.patch
>   delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-Added-KMSsink-support.patch
>   delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-waylandsink-Removed-dependency-on-dri2.patch
>   delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch
>   delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-GstDRMBufferPool-support-fix.patch
>
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Added-GstDRMBufferPool-support.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Added-GstDRMBufferPool-support.patch
> deleted file mode 100644
> index c7015b2..0000000
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-Modified-waylandsink-to-accept-NV12-format.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-Modified-waylandsink-to-accept-NV12-format.patch
> deleted file mode 100644
> index 875ff0b..0000000
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-Added-KMSsink-support.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-Added-KMSsink-support.patch
> deleted file mode 100644
> index 8c19fa6..0000000
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-waylandsink-Removed-dependency-on-dri2.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-waylandsink-Removed-dependency-on-dri2.patch
> deleted file mode 100644
> index 8c2e887..0000000
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch
> deleted file mode 100644
> index 8ae79b5..0000000
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-GstDRMBufferPool-support-fix.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-GstDRMBufferPool-support-fix.patch
> deleted file mode 100644
> index 0af1323..0000000
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
> index 2e91320..831b8ac 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
> @@ -11,13 +11,12 @@ DEPENDS_append_omap-a15 = " \
>
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>
> -SRC_URI_append = " \
> -        file://0001-Added-GstDRMBufferPool-support.patch \
> -        file://0002-Modified-waylandsink-to-accept-NV12-format.patch \
> -        file://0003-Added-KMSsink-support.patch \
> -        file://0004-waylandsink-Removed-dependency-on-dri2.patch \
> -        file://0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch \
> -        file://0006-GstDRMBufferPool-support-fix.patch \
> -"
> +SRC_URI = "git://git.ti.com/glsdk/gstreamer1-0-plugins-bad.git;protocol=git \
> +          "
> +
> +S = "${WORKDIR}/git"
> +
> +SRCREV = "12b0d2ac50aba19da53d2e1ac40d6ada70a79930"
> +
> +PR_append = "-arago5"
>
> -PR_append = "-arago3"
>


