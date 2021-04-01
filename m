Return-Path: <nm@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id E355552CB8
	for <meta-arago@arago-project.org>;
	Thu,  1 Apr 2021 21:50:23 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 131Loij5008486;
	Thu, 1 Apr 2021 16:50:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617313844;
	bh=yHzixJphbeSVnAksVLR8FBIiyfH7V4fmTEqCvOLH1vU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=X4n6h9jGy8KF33t8vgQxPHMSFLIKza0qUDPB3MMxjUAVg/a9bUCQECQNb+rJfpgPQ
	S0HEStqdWgD43OWsLZHz//zc/l/n4H8rm0Cnlwu6Fw+Wjdn/+LUFYs+XG0LqJwixkl
	7XXYM/+k5WdtwF10iVw9nBPCk73wjMkIBu+XEjJI=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 131LoiNM097688
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Apr 2021 16:50:44 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Thu, 1 Apr 2021 16:50:44 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Thu, 1 Apr 2021 16:50:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 131Loisw098445;
	Thu, 1 Apr 2021 16:50:44 -0500
Date: Thu, 1 Apr 2021 16:50:44 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20210401215044.ezdabzzl7t334blj@lasso>
References: <1617312217-14991-1-git-send-email-denis@denix.org>
	<1617312217-14991-3-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1617312217-14991-3-git-send-email-denis@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [dunfell/master][PATCH 2/7] branding-mainline: remove gpu machine feature
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
X-List-Received-Date: Thu, 01 Apr 2021 21:50:24 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 17:23-20210401, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> GPU support requires out-of-tree SGX and RGX drivers not available in mainline.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>  meta-arago-distro/conf/distro/include/branding-mainline.inc | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta-arago-distro/conf/distro/include/branding-mainline.inc b/meta-arago-distro/conf/distro/include/branding-mainline.inc
> index e6d8574..786508d 100644
> --- a/meta-arago-distro/conf/distro/include/branding-mainline.inc
> +++ b/meta-arago-distro/conf/distro/include/branding-mainline.inc
> @@ -2,3 +2,6 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-ti-mainline"
>  PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-mainline"
>  PREFERRED_PROVIDER_u-boot = "u-boot-ti-mainline"
>  SRCREV_ti-upstream-tools_pn-linux-ti-mainline = "${AUTOREV}"
> +
> +# GPU support requires out-of-tree SGX and RGX drivers not available in mainline
> +MACHINE_FEATURES_remove = "gpu"


I was wondering if we should pick s/w mesa instead? I'd like display
testing to be a little more robust... minimal drm tests are'nt playing
too nicely with our test frameworks..

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

