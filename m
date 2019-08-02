Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 6A7A552A36
	for <meta-arago@arago-project.org>;
	Fri,  2 Aug 2019 22:21:45 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x72MKohR027551
	for <meta-arago@arago-project.org>; Fri, 2 Aug 2019 17:20:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1564784450;
	bh=F/mzwVTZkmupzBTKE+NG0SJ6bSNYHU8kZd5xrbtTgt8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=wu0IcEipql8oGFO1mq/I1GqTruh9jmFI/OLZQShNVq6RPuqQuRo/gJ9tXRoQ03IXa
	/SkkH8+ZV20lfhsoyP4nIYe+frWWmP7I6kkOcK8+PM0fzJLCX6NKZliZAqzMlebBm4
	IMvcrecNcxQ5GDbSEAcRL9bIwuhOv53JXWDVFF/s=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x72MKomw011035
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 2 Aug 2019 17:20:50 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 2 Aug 2019 17:20:50 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 2 Aug 2019 17:20:50 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x72MKohA047010;
	Fri, 2 Aug 2019 17:20:50 -0500
Date: Fri, 2 Aug 2019 18:20:49 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jonathan Bergsagel <jbergsagel@ti.com>
Message-ID: <20190802222049.GW20944@beryl>
References: <20190802220135.26607-1-jbergsagel@ti.com>
MIME-Version: 1.0
In-Reply-To: <20190802220135.26607-1-jbergsagel@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, Santosh Jha <sjha@ti.com>,
	Suman Anna <s-anna@ti.com>
Subject: Re: [PATCH v2] packagegroup-arago-tisdk-addons: add ipc-lld-fw-am65x
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
X-List-Received-Date: Fri, 02 Aug 2019 22:21:46 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

After refactoring the code, the subject line is incorrect:
> packagegroup-arago-tisdk-addons: add ipc-lld-fw-am65x


On Fri, Aug 02, 2019 at 05:01:35PM -0500, Jonathan Bergsagel wrote:
> Added IPC echo test binaries for AM65xx
> 
> Signed-off-by: Jonathan Bergsagel <jbergsagel@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-tisdk-addons.bb            | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index 21aa7244ba19..f0307fe78c4e 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -75,7 +75,7 @@ UTILS_append_k3 = " mmc-utils \
>                      irqbalance \
>  "
>  
> -UTILS_append_am65xx = " ti-ipc-rtos-fw pru-icss"
> +UTILS_append_am65xx = " ipc-lld-fw ti-ipc-rtos-fw pru-icss"
>  UTILS_append_j7-evm = " ipc-lld-fw ti-display-sharing-fw jailhouse"
>  
>  UTILS_append_omapl138 = " ti-ipc-rtos-fw"
> -- 
> 2.17.1
> 

