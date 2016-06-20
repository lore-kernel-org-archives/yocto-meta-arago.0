Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 7C17B5299F
	for <meta-arago@arago-project.org>;
	Mon, 20 Jun 2016 21:10:12 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5KL9WTp018335
	for <meta-arago@arago-project.org>; Mon, 20 Jun 2016 16:09:32 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5KLABCH027960
	for <meta-arago@arago-project.org>; Mon, 20 Jun 2016 16:10:12 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 20 Jun 2016 16:10:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5KLABAe010368;
	Mon, 20 Jun 2016 16:10:11 -0500
Date: Mon, 20 Jun 2016 17:10:11 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20160620211010.GF2177@edge>
References: <1465821936-2658-1-git-send-email-a0393906@ti.com>
	<1465821936-2658-2-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1465821936-2658-2-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 2/3] gstreamer1.0-plugins-ducati: Upgrade to GST 1.6.3
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
X-List-Received-Date: Mon, 20 Jun 2016 21:10:12 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jun 13, 2016 at 06:15:35PM +0530, Karthik Ramanan wrote:
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb         | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
> index 11ec8f9..7b24eeb 100644
> --- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
> +++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
> @@ -4,7 +4,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
>  
>  require gstreamer1.0-plugins-ti.inc
>  
> -PR = "${INC_PR}.4"
> -SRCREV = "b2afa71ef76518ef8d368c6669c94d823e7972ba"
> +PR = "${INC_PR}.11"
> +SRCREV = "be329c73f19f48faec3d2c323532ba1ec1d22395"
>  
> -SRC_URI = "git://git.ti.com/glsdk/gst-plugin-ducati.git;protocol=git"
> +BRANCH ?= "master"
> +
> +SRC_URI = "git://git.ti.com/glsdk/gst-plugin-ducati.git;protocol=git;branch=${BRANCH} \
> +          "
> +
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

What is the need for this? ^^^

-- 
Denys

