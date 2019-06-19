Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 45878529D8
	for <meta-arago@arago-project.org>;
	Wed, 19 Jun 2019 19:33:29 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5JJWlh1086928
	for <meta-arago@arago-project.org>; Wed, 19 Jun 2019 14:32:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560972767;
	bh=MF2bSawOL6RYTL3ixcl9FmS2CdTqojQkActTlkfEEdM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=UbeOvK2I4h3EhBU8ntgzsVZusS6kTdlrO2YI5u1V1NlJpbJoi1XWOWcS59e4BNnRY
	zpfAkX0poSP6mv0/HoqwYzePpmgF4h2/iyon3T0E8oBsct7QjONgzSadZmCuZCpp9D
	lHKNDeOVNbiouJ6lb0M2p4l3y5HiSPtIwnzlDQl0=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5JJWlj4038467
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 19 Jun 2019 14:32:47 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 19 Jun 2019 14:32:47 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 19 Jun 2019 14:32:47 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5JJWlBh119615;
	Wed, 19 Jun 2019 14:32:47 -0500
Date: Wed, 19 Jun 2019 15:32:46 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <angelabaker@ti.com>
Message-ID: <20190619193246.GP32001@beryl>
References: <1560896377-11268-1-git-send-email-angelabaker@ti.com>
MIME-Version: 1.0
In-Reply-To: <1560896377-11268-1-git-send-email-angelabaker@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, d-huang@ti.com, sunitan@ti.com
Subject: Re: [thud][PATCH] gstreamer1.0*-good: Add HEVC support for v4l2 decoder plugin
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
X-List-Received-Date: Wed, 19 Jun 2019 19:33:29 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jun 18, 2019 at 05:19:37PM -0500, angelabaker@ti.com wrote:
> From: Angela Stegmaier <angelabaker@ti.com>
> 
> HEVC support was added to v4l2 decoder plugin after 1.14.4 release.
> This patch cherry-picks the 2 patches needed for HEVC support
> from upstream to bring the support to 1.14.4.
> 
> Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
> ---
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.4.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.4.bbappend
> index edffa28..57010c8 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.4.bbappend
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.4.bbappend
> @@ -1,4 +1,4 @@
> -PR_append = ".arago0"
> +PR_append = ".arago1"
>  
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
> @@ -6,3 +6,8 @@ SRC_URI += " \
>        file://0001-v4l2src-Increase-minimum-num-buffers-by-3.patch \
>        file://0002-v4l2src-Use-generic-dmabuf-import-in-v4l2src.patch \
>        "
> +
> +SRC_URI_append_j7-evm = " \

Both patches are upstream backports and are not specific to any TI platform. 
Moreover, the recipe is not marked as machine-specific, hence please don't do 
_append_j7-evm here - please enable those patches for all platforms.


> +      file://0001-v4l2-Sync-kernel-header-with-linuxtv-tree.patch \
> +      file://0002-v4l2videodec-Add-HEVC-decoder-support.patch \
> +      "
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

