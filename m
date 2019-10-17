Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 5C2E252986
	for <meta-arago@arago-project.org>;
	Thu, 17 Oct 2019 18:33:45 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9HIWTV4060337
	for <meta-arago@arago-project.org>; Thu, 17 Oct 2019 13:32:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1571337149;
	bh=YQmo0Dj7iefjYNW+hhpTuSPdQOLaHDDAH8nxV6XQbz0=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=CEVFh2djDZoT3zqVZAW0I0SWkKqe6P1JseqO2kkZd+jkavvg9KtP0PP/oc7Hbfm2W
	1+Sen+qd6EIXab7HM7yGWwJDXCO8FH4X+23Pt+SkM91jhhGBL/cwjtwGtNG14EMsDW
	VtDTGuC3/pXOVLPfy6EFMp6TbY17a+HONFyktLLQ=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9HIWT25066351
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 17 Oct 2019 13:32:29 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 17 Oct 2019 13:32:20 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 17 Oct 2019 13:32:20 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9HIWSw1064326
	for <meta-arago@arago-project.org>; Thu, 17 Oct 2019 13:32:28 -0500
Date: Thu, 17 Oct 2019 14:32:28 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20191017183228.GJ19868@beryl>
References: <20191017181524.20463-1-denys@ti.com>
MIME-Version: 1.0
In-Reply-To: <20191017181524.20463-1-denys@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [thud/master][PATCH] kselftests: re-add ptp into main RDEPENDS
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
X-List-Received-Date: Thu, 17 Oct 2019 18:33:45 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Sorry, wrong list.

On Thu, Oct 17, 2019 at 06:15:24PM +0000, Denys Dmytriyenko wrote:
> Commit 371b7bb52225a3f7aadf57910aa9af3bf26c0e78 enabled ptp package, but
> did not add it to RDEPENDS, fix it.
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-kernel/kselftests/kselftests_4.10.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/recipes-kernel/kselftests/kselftests_4.10.bb b/recipes-kernel/kselftests/kselftests_4.10.bb
> index b28868f5..96263875 100644
> --- a/recipes-kernel/kselftests/kselftests_4.10.bb
> +++ b/recipes-kernel/kselftests/kselftests_4.10.bb
> @@ -160,6 +160,7 @@ RDEPENDS_${PN} += "bash \
>  	${PN}-net \
>  	${PN}-nsfs \
>  	${PN}-pstore \
> +	${PN}-ptp \
>  	${PN}-ptrace \
>  	${PN}-seccomp \
>  	${PN}-sigaltstack \
> -- 
> 2.17.1
> 

