Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 4A8AB52090
	for <meta-arago@arago-project.org>;
	Thu, 27 Sep 2018 21:34:18 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RLYAer130821
	for <meta-arago@arago-project.org>; Thu, 27 Sep 2018 16:34:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538084050;
	bh=NwW0+0zAxX6jTPpjpONqmlHDzVEOaxHuxrAm/jZr2Qc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=iV0TVPABvW85Tav711qxhHgQWlR9N13j9IlyuQOZ6ujndtx8yWQZfSX3IhqP+5A0l
	xKBu8exhX/cSszQhiJkqXjmt1ghRnmN3MtubwjTxWaz4I7dN7T4dYIy+MFWFoaZqbW
	s/rHPm2RM63u1USIor9UR0tzRs+NQBjVYk6gKzWY=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RLY9bf017868
	for <meta-arago@arago-project.org>; Thu, 27 Sep 2018 16:34:09 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 16:34:10 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 27 Sep 2018 16:34:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RLY9AJ028380;
	Thu, 27 Sep 2018 16:34:09 -0500
Date: Thu, 27 Sep 2018 17:34:09 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Message-ID: <20180927213409.GL8582@beryl>
References: <1538081991-52963-1-git-send-email-m-radhakrishnan2@ti.com>
	<1538081991-52963-3-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
In-Reply-To: <1538081991-52963-3-git-send-email-m-radhakrishnan2@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [rocko/master/ti2018.03][PATCH v2 2/2] big-data-ipc-demo: Update to version 01.02.00.00
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
X-List-Received-Date: Thu, 27 Sep 2018 21:34:18 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

ACK

On Thu, Sep 27, 2018 at 04:59:51PM -0400, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  .../recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc            | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc
> index 307e5e9..3e6e5fa 100644
> --- a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc
> +++ b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc
> @@ -8,14 +8,14 @@ BIG_DATA_IPC_GIT_URI = "git://git.ti.com/processor-sdk/big-data-ipc-examples.git
>  BIG_DATA_IPC_GIT_PROTOCOL = "git"
>  BIG_DATA_IPC_GIT_BRANCH = "master"
>  
> -# Below commit ID corresponds to "DEV.BIG_DATA_IPC.01.01.00.00"
> -BIG_DATA_IPC_SRCREV = "5907bff5a29fe2ba8719ae8c3c5d62b20b7b6bc9"
> +# Below commit ID corresponds to "DEV.BIG_DATA_IPC.01.02.00.00"
> +BIG_DATA_IPC_SRCREV = "5ef821453c58e997bba0cf47aa9f54e616097861"
>  
>  BRANCH = "${BIG_DATA_IPC_GIT_BRANCH}"
>  SRC_URI = "${BIG_DATA_IPC_GIT_URI};protocol=${BIG_DATA_IPC_GIT_PROTOCOL};branch=${BRANCH}"
>  
>  SRCREV = "${BIG_DATA_IPC_SRCREV}"
> -PV = "01.01.00.00"
> +PV = "01.02.00.00"
>  
>  S = "${WORKDIR}/git"
>  
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

