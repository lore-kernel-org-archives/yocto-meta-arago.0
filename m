Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 8E9F452998
	for <meta-arago@arago-project.org>;
	Mon,  3 Jun 2019 16:25:54 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x53GPGeX048222
	for <meta-arago@arago-project.org>; Mon, 3 Jun 2019 11:25:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1559579116;
	bh=t0YiKfa4yAalRIRKBTgODhfXaZ7fNr6TS8MYYGz42ng=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Zo46hCtuDkNm/tk3ugz+RJBP8bY4ZVnjTjAQCn8ppcGfC9j0whDQuSbvgs8lr/2af
	UxwFrgHvUnmVVpDGMXm78htD5Jhe3VCs5bu16CMBSb99p/e/VfqSOMOMnqptgjiiDu
	1lJ5/TmG79ArtJse1ABN6I3thNE3xtXAd3IofsE0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x53GPGQR022372
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 3 Jun 2019 11:25:16 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 3 Jun 2019 11:25:15 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 3 Jun 2019 11:25:15 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x53GPFd1030227;
	Mon, 3 Jun 2019 11:25:15 -0500
Date: Mon, 3 Jun 2019 12:25:15 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20190603162515.GD18469@beryl>
References: <20190531152100.19757-1-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <20190531152100.19757-1-e-ruei1@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 0/4] add MACHINE FEATURES condition sgx for additional modules and demos
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
X-List-Received-Date: Mon, 03 Jun 2019 16:25:57 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Probably fine for now. I'm thinking we should group packagegroups slightly 
differently, so conditions like "sgx" can be done in one place, instead of 
sprinkling throughout the code...

Denys


On Fri, May 31, 2019 at 11:20:56AM -0400, Eric Ruei wrote:
> There are more modules and demos should not be included for non-sgx build
> and therefore MACHINE FATURES condition (sgx) is added.
> 
> Eric Ruei (4):
>   packagegroup-arago-tisdk-addons:add MACHINE FEATURES condition sgx for
>     certain modules
>   packagegroup-arago-tisdk-graphics: add MACHINE FEATURES condition sgx
>     for certain modules
>   packagegroup-arago-tisdk-matrix: add MACHINE FEATURES condition sgx
>     for certain demos
>   matrix-gui-machinevision-demos: add MACHINE FEATURES condition sgx for
>     certain demos
> 
>  .../packagegroups/packagegroup-arago-tisdk-addons.bb |  4 ++--
>  .../packagegroup-arago-tisdk-graphics.bb             | 12 ++++++------
>  .../packagegroups/packagegroup-arago-tisdk-matrix.bb |  6 +++---
>  .../matrix/matrix-gui-machinevision-demos_2.0.bb     |  4 ++--
>  4 files changed, 13 insertions(+), 13 deletions(-)
> 
> -- 
> 2.17.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

