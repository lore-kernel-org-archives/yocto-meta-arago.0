Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 1C08B5298B
	for <meta-arago@arago-project.org>;
	Tue, 11 Feb 2020 04:35:45 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01B4XnwZ130840
	for <meta-arago@arago-project.org>; Mon, 10 Feb 2020 22:33:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581395629;
	bh=i59GfAHDHWHW9hd4PcuWAtm3Dfnl9bv6B7FTT+l+0/4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=PLfWsko8r99a5cbdHKD5B6Zfq3P4e6lDhE0JcQy06JI9XfKQLbE0fvorMrlRGgnm4
	ZrS7Z0r94BHC9Ru0qK4h1F7gyJPJWqDAFfzMdC8T0Xp2Orm/UmafMVK+H5OlRNqmVY
	HeXyJeL2Mnm0hNLJDuk4YxB44O9U2KtmuV51/wOw=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01B4Xnxg039165
	for <meta-arago@arago-project.org>; Mon, 10 Feb 2020 22:33:49 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Mon, 10 Feb 2020 22:33:48 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Mon, 10 Feb 2020 22:33:48 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01B4Xmk4089349;
	Mon, 10 Feb 2020 22:33:48 -0600
Date: Mon, 10 Feb 2020 23:33:48 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Angela Stegmaier <angelabaker@ti.com>
Message-ID: <20200211043348.GA20281@beryl>
References: <1581351918-32354-1-git-send-email-angelabaker@ti.com>
MIME-Version: 1.0
In-Reply-To: <1581351918-32354-1-git-send-email-angelabaker@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [zeus/master][PATCH] packagegroup-arago-tisdk-addons: replacing ipc-lld-fw
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
X-List-Received-Date: Tue, 11 Feb 2020 04:35:45 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Have you tried building it?


On Mon, Feb 10, 2020 at 10:25:18AM -0600, Angela Stegmaier wrote:
> From: Santosh Jha <sjha@ti.com>
> 
> Replacing ipc-lld-fw with ipc-lld-examples-rtos to
> build from source.
> 
> Signed-off-by: Santosh Jha <sjha@ti.com>
> Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
> ---
>  .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb     | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index a1b55ee..1612322 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -77,8 +77,8 @@ UTILS_append_k3 = " mmc-utils \
>                      jailhouse \
>  "
>  
> -UTILS_append_am65xx = " ipc-lld-fw ti-ipc-rtos-fw pru-icss pru-pwm-fw"
> -UTILS_append_j7-evm = " ipc-lld-fw pru-icss ti-display-sharing-fw cpsw9g-eth-fw"
> +UTILS_append_am65xx = " ipc-lld-examples-rtos ti-ipc-rtos-fw pru-icss pru-pwm-fw"
> +UTILS_append_j7-evm = " ipc-lld-examples-rtos pru-icss ti-display-sharing-fw cpsw9g-eth-fw"
>  
>  UTILS_append_omapl138 = " ti-ipc-rtos-fw"
>  
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

