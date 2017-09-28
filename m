Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 400EC52A10
	for <meta-arago@arago-project.org>;
	Thu, 28 Sep 2017 17:56:51 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8SHupF9005049
	for <meta-arago@arago-project.org>; Thu, 28 Sep 2017 12:56:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506621411;
	bh=3CG8Qm5WHyOL5tXS5JXz5KK22NKpW7pdS7BBRniX/nc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=EQwvbvrD1d94lJCmQ7d+HNda1p6zQ3FVAFa+2w/trCySzg+cvZn9RteNGU3NLyT8B
	e4xdNtYt1aQq7opnLVWrgKMvF+HiBn4AnJ656bBgCsw+KLeyal9rowRrAfufZe+CLs
	tLZzYO0r+CI9IWiy3zF8CXbSLlWnW1+koOOpxCF8=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8SHupqZ009353
	for <meta-arago@arago-project.org>; Thu, 28 Sep 2017 12:56:51 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 28 Sep 2017 12:56:51 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 28 Sep 2017 12:56:50 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8SHuoLB008830;
	Thu, 28 Sep 2017 12:56:50 -0500
Date: Thu, 28 Sep 2017 13:56:35 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Manisha Agrawal <manisha.agrawal@ti.com>
Message-ID: <20170928175635.GC8393@edge>
References: <20170922193417.1595-1-manisha.agrawal@ti.com>
	<20170922193417.1595-5-manisha.agrawal@ti.com>
MIME-Version: 1.0
In-Reply-To: <20170922193417.1595-5-manisha.agrawal@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [morty][PATCH v2 5/6] packagegroup-arago-tisdk-hmi: add protection-relays-hmi demo
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
X-List-Received-Date: Thu, 28 Sep 2017 17:56:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Sep 22, 2017 at 02:34:16PM -0500, Manisha Agrawal wrote:
> Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
> ---
>  .../recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb  | 1 +
>  .../recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb           | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
> index 735dda8e..4921147c 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
> @@ -14,6 +14,7 @@ HMI_append_ti43x = " \
>  
>  HMI_append_ti33x = " \
>      evse-hmi-src \
> +    protection-relays-hmi-src \

^^^ This patch should have been after the one that adds srcipk support. I'll 
swap #5 and #6...


>  "
>  
>  
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
> index 38ff06b4..125443ae 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
> @@ -12,6 +12,7 @@ HMI = " \
>  
>  HMI_append_ti33x = " \
>      evse-hmi \
> +    protection-relays-hmi \
>  "
>  
>  HMI_append_ti43x = " \
> -- 
> 2.13.0
> 

