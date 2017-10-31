Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 8229C52A25
	for <meta-arago@arago-project.org>;
	Tue, 31 Oct 2017 20:19:25 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9VKJF2j007923
	for <meta-arago@arago-project.org>; Tue, 31 Oct 2017 15:19:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1509481155;
	bh=0FHbZPrpAtZuV2S5qwZXXu3T2EZl3HXeR4IY/vBJavc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ZH/TO/TulEdV6sbPXai6/keyhruY3QFQM9o+Xbyqbd2EXiX+efwEwq1W0SG5eB6kp
	9HTiJ8W23DCWtNNkYhYzP00es8udquHkSaRK0kX/lf26ZGBAj0rBsLCzXUbdI3XCb+
	wSuxelDbyAFq78/a7BbBGQ53a7dmueBf+4uew9Tc=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9VKJAjS002416
	for <meta-arago@arago-project.org>; Tue, 31 Oct 2017 15:19:10 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 31 Oct 2017 15:19:10 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 31 Oct 2017 15:19:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9VKJAjt023074;
	Tue, 31 Oct 2017 15:19:10 -0500
Date: Tue, 31 Oct 2017 16:18:54 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20171031201854.GD12918@edge>
References: <1509466602-173226-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1509466602-173226-1-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [krogoth] packagegroup-arago-tisdk-multimedia: TMP: Remove dspdce-fw temporarily
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
X-List-Received-Date: Tue, 31 Oct 2017 20:19:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Karthik,

Please stop removing [PATCH] qualifier from the Subject line. If you want to 
specify krogoth, you should add extra [krogoth], not replace existing tags...

-- 
Denys


On Tue, Oct 31, 2017 at 09:46:42PM +0530, Karthik Ramanan wrote:
> From: Sam Nelson <sam.nelson@ti.com>
> 
> Build with new bios version is broken. Need to be fixed.
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> 
> (from meta-arago/morty f2b86b34c7664425a98c69de52af62ce1c968539)
> 
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> index d850e0f..a468086 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> @@ -36,7 +36,7 @@ MULTIMEDIA_append_omap5-evm = " \
>  ACCEL_FW = ""
>  
>  ACCEL_FW_append_am57xx-evm = " \
> -    ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw dspdce-fw', '', d)} \
> +    ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw', '', d)} \
>  "
>  
>  ACCEL_FW_append_omap5-evm = " \
> @@ -44,7 +44,7 @@ ACCEL_FW_append_omap5-evm = " \
>  "
>  
>  ACCEL_FW_append_dra7xx-evm = " \
> -    ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw dspdce-fw', '', d)} \
> +    ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw', '', d)} \
>      vis \
>  "
>  
> -- 
> 1.9.1
> 

