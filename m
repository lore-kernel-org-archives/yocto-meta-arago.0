Return-Path: <nm@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 6BDB052CB9
	for <meta-arago@arago-project.org>;
	Thu,  1 Apr 2021 21:50:42 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 131Lp3ak008549;
	Thu, 1 Apr 2021 16:51:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617313863;
	bh=HZVoxd6DpywR8P/iLkA/zE3nMUV4nAFZUdHkBrxfuwc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Uc9T7rQ87R9DG4f7AE+lYivVEGBgZILJMb8A5VTWhW2En0VJ9oA128SNqujJAAZwt
	whaRhx6N/FZXDJyKJ5sIPelRYcxe39lC/VELQ8pA0jNy8zMf50GBEz0Sb/ZmsyKUU+
	B78RTocAgu5R6NEmnekQrPXT3Gsco9iU3c0tyqwc=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 131Lp3SS098037
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Apr 2021 16:51:03 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Thu, 1 Apr 2021 16:51:02 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Thu, 1 Apr 2021 16:51:03 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 131Lp2Fm099121;
	Thu, 1 Apr 2021 16:51:02 -0500
Date: Thu, 1 Apr 2021 16:51:02 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20210401215102.o3xej3dlmpijwf3d@qualm>
References: <1617312217-14991-1-git-send-email-denis@denix.org>
	<1617312217-14991-2-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1617312217-14991-2-git-send-email-denis@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [dunfell/master][PATCH 1/7] make-mod-scripts: pass CROSS_COMPILE to configure and build
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
X-List-Received-Date: Thu, 01 Apr 2021 21:50:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 17:23-20210401, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> The fix is submitted upstream to oe-core/master.
> For now also do it locally in a bbappend, so it also fixed for dunfell.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>  .../recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bbappend        | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 100644 meta-arago-distro/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bbappend
> 
> diff --git a/meta-arago-distro/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bbappend b/meta-arago-distro/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bbappend
> new file mode 100644
> index 0000000..b76af9f
> --- /dev/null
> +++ b/meta-arago-distro/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bbappend
> @@ -0,0 +1 @@
> +EXTRA_OEMAKE += "CROSS_COMPILE=${TARGET_PREFIX}"
> -- 
> 2.7.4
> 

Aaah, thanks..
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

