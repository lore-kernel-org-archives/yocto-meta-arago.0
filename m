Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 2196C5297F
	for <meta-arago@arago-project.org>;
	Thu, 27 Sep 2018 19:29:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RJTXgd103591
	for <meta-arago@arago-project.org>; Thu, 27 Sep 2018 14:29:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538076573;
	bh=l0vYP17oN5EOXTdGososgAZR1Vsh+2zaSoNL3ZDRXFU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=GXLG6xjuSzxlYuODQ0vcdFBjS5PKpwQVJdLwCMxpaNbx6wezoJZKvaYyLkHiAXM9W
	HAynaIpwU51NWw2w7aHZMnAmbExsouXyHQ8lb7AYz9aKvIL2iUXevmPV1of8RKv5MZ
	JTmpRuVtNyHXhvtnvzjiwXnQX5Ln4GB+4dqI2dXI=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RJTXEj009130
	for <meta-arago@arago-project.org>; Thu, 27 Sep 2018 14:29:33 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 14:29:33 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 27 Sep 2018 14:29:33 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RJTXCt001350;
	Thu, 27 Sep 2018 14:29:33 -0500
Date: Thu, 27 Sep 2018 15:29:32 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Message-ID: <20180927192932.GB8582@beryl>
References: <1538062570-55253-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
In-Reply-To: <1538062570-55253-1-git-send-email-m-radhakrishnan2@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [morty][meta-processor-sdk][PATCH 0/2] Patches for Procsdk 5.1 release
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
X-List-Received-Date: Thu, 27 Sep 2018 19:29:44 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Now, these 2 are for rocko/master/ti2018.03, not morty/meta-processor-sdk...


On Thu, Sep 27, 2018 at 11:36:08AM -0400, Mahesh Radhakrishnan wrote:
> The below patchset are the RTOS patches needed for Processor SDK 5.1 release
> 
> Mahesh Radhakrishnan (2):
>   posix-smp-demo: Update to versin 01.01.00.02B
>   big-data-ipc-demo: Update to version 01.02.00.00
> 
>  .../recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc            | 6 +++---
>  meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc    | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

