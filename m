Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 6A54B52AC0
	for <meta-arago@arago-project.org>;
	Tue, 29 Aug 2017 17:29:30 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7THTUEV015300
	for <meta-arago@arago-project.org>; Tue, 29 Aug 2017 12:29:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504027770;
	bh=MIl6+fXIXytxpBrdR363FMhEaHlgGh3c9gd2iYdBiz0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=VMsB3gvoS7OfUM8BsbUbfQEqO7xcd2MMLRwYjIkZDyZaPSwh9x23gZtm3tiLBO2B3
	p5H8J9fMgUrg8FI6KKzmgO50qMzozD1E+IpQjYds0RPIq7J6aTlLN/IPiiZXIMUD5a
	iaLhPCIg0ndAyvYlh4d2TEg1rmADOZ8yQBNON8RU=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7THTU7h019815
	for <meta-arago@arago-project.org>; Tue, 29 Aug 2017 12:29:30 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 29 Aug 2017 12:29:30 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 29 Aug 2017 12:29:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7THTTie005416;
	Tue, 29 Aug 2017 12:29:30 -0500
Date: Tue, 29 Aug 2017 13:29:25 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Manisha Agrawal <manisha.agrawal@ti.com>
Message-ID: <20170829172925.GH8304@edge>
References: <20170829163826.15777-1-manisha.agrawal@ti.com>
	<20170829163826.15777-6-manisha.agrawal@ti.com>
MIME-Version: 1.0
In-Reply-To: <20170829163826.15777-6-manisha.agrawal@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [morty][PATCH v2 6/6] arago-distro : recipes-core : tisdk-rootfs-image
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
X-List-Received-Date: Tue, 29 Aug 2017 17:29:30 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Change subject:

> arago-distro : recipes-core : tisdk-rootfs-image

> tisdk-rootfs-image: add evse-hmi packagegroup


> Add evse-hmi image to the rootfs.

If you change subject like above, this won't be needed.


> Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
> ---
>  meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
> index 1a477d1..e40dc1f 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
> @@ -20,6 +20,7 @@ IMAGE_INSTALL += "\
>      packagegroup-arago-tisdk-amsdk \
>      packagegroup-arago-tisdk-addons \
>      packagegroup-arago-tisdk-addons-extra \
> +    packagegroup-arago-tisdk-hmi \
>      "
>  
>  export IMAGE_BASENAME = "tisdk-rootfs-image"
> -- 
> 2.13.0
> 

