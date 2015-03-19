Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id C2A1F52A77
	for <meta-arago@arago-project.org>;
	Thu, 19 Mar 2015 22:36:34 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2JMaYqE028901
	for <meta-arago@arago-project.org>; Thu, 19 Mar 2015 17:36:34 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2JMaWol004196
	for <meta-arago@arago-project.org>; Thu, 19 Mar 2015 17:36:33 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 19 Mar 2015 17:36:32 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2JMaWZN021151	for
	<meta-arago@arago-project.org>; Thu, 19 Mar 2015 17:36:32 -0500
Date: Thu, 19 Mar 2015 18:36:32 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20150319223632.GH11557@edge>
References: <1426800578-7496-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1426800578-7496-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] gstreamer1.0-plugins-bad: add DEPENDS on libdrm and libdce due to KMSsink
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
X-List-Received-Date: Thu, 19 Mar 2015 22:36:35 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Karthik,

I had a question - I see that KMSsink in plugins-bad checks for drm and dce 
headers. I was trying to set the dependency accordingly, but it would break 
non dce platforms. Can you please elaborate on that a bit? Thanks.

-- 
Denys


On Thu, Mar 19, 2015 at 05:29:38PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend                 | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
> index b1cacac..bd141a8 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
> @@ -2,6 +2,8 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
>  PACKAGECONFIG = "faad wayland"
>  
> +DEPENDS += "libdrm libdce"
> +
>  SRC_URI_append = " \
>          file://0001-Added-GstDRMBufferPool-support.patch \
>          file://0002-Modified-waylandsink-to-accept-NV12-format.patch \
> @@ -9,4 +11,4 @@ SRC_URI_append = " \
>          file://0004-waylandsink-Removed-dependency-on-dri2.patch \
>          file://0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch"
>  
> -PR_append = "-arago0"
> +PR_append = "-arago1"
> -- 
> 2.2.0
> 

