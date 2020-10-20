Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 07BA752968
	for <meta-arago@arago-project.org>;
	Tue, 20 Oct 2020 00:57:26 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09K0sMlw029559;
	Mon, 19 Oct 2020 19:54:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603155262;
	bh=qpj7NThy+eHrNQe4xwAM/xHHBBgwKnUB03gsYIc/QsI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=f/0fZu4taWruqDSMC7eZyM8UWDA0DP+MxXY2nGyGp/C+BmHskmQYvNHj4+xlbOgaG
	zb1c+GW5nYwHnM5DbHROhB9z2jGtOSdnOD6zjOzV7PCQVx20xkz6NYFSCw611pK3Db
	tyAt+eXfZY0DcvWGyjyGh6JKI15ahpWw3IsFHtxU=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09K0sMNP055066
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Oct 2020 19:54:22 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Mon, 19 Oct 2020 19:54:22 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Mon, 19 Oct 2020 19:54:22 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09K0sMQX032203;
	Mon, 19 Oct 2020 19:54:22 -0500
Date: Mon, 19 Oct 2020 20:54:21 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Paul Barker <pbarker@konsulko.com>
Message-ID: <20201020005421.GN14852@beryl>
References: <20201019194549.169360-1-pbarker@konsulko.com>
MIME-Version: 1.0
In-Reply-To: <20201019194549.169360-1-pbarker@konsulko.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v2] packagegroup-arago-sysvinit-boot: Skip recipe if sysvinit is not enabled
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
X-List-Received-Date: Tue, 20 Oct 2020 00:57:27 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Oct 19, 2020 at 08:45:49PM +0100, Paul Barker wrote:
> This change fixes the following error seen at parse time when the
> meta-arago-distro layer is present but sysvinit is not in
> DISTRO_FEATURES:
> 
>     ERROR: .../meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb: Please ensure that your setting of VIRTUAL-RUNTIME_init_manager (sysvinit) matches the entries enabled in DISTRO_FEATURES
>     ERROR: Failed to parse recipe: .../meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
> 
> Signed-off-by: Paul Barker <pbarker@konsulko.com>

Reviewed-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  .../packagegroups/packagegroup-arago-sysvinit-boot.bb          | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
> index 2eb2d777..9f937343 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
> @@ -1,3 +1,6 @@
> +REQUIRED_DISTRO_FEATURES = "sysvinit"
> +inherit features_check
> +
>  require recipes-core/packagegroups/packagegroup-core-boot.bb
>  
>  PR = "r0"
> -- 
> 2.28.0
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

