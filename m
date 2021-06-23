Return-Path: <nm@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 165B052AB8
	for <meta-arago@arago-project.org>;
	Wed, 23 Jun 2021 21:17:40 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15NLHejW054752;
	Wed, 23 Jun 2021 16:17:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1624483060;
	bh=ogrmhnWPks2r3qzw50B13SPi+RBoQcJLsDnKuGijwTk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=JdULZeTZVz5HIf7A6ksMYeQLy/WfPp8QLY6gi/dlypQUeGD2JJTLJ026iQc6i03K6
	nlqfJEyvQbN3WLMDb5ZKOso68R3KifpE4u+a+f759CrqrgvWsphzJH4KXVQCsNrrXK
	vXAM5wCSZo3F76vLz02RS8moDhM1ZEaTdMWjQV1g=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15NLHevj066214
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Jun 2021 16:17:40 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Wed, 23 Jun 2021 16:17:40 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Wed, 23 Jun 2021 16:17:40 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15NLHepZ057874;
	Wed, 23 Jun 2021 16:17:40 -0500
Date: Wed, 23 Jun 2021 16:17:40 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20210623211740.7q5z5hdih773n6zs@kooky>
References: <20210623023538.32735-1-nm@ti.com>
	<20210623023538.32735-3-nm@ti.com>
	<20210623190939.GH1528@denix.org>
MIME-Version: 1.0
In-Reply-To: <20210623190939.GH1528@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [oe-layersetup PATCH 2/3] configs: Redirect older meta-ti to yoctoproject primary repo
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
X-List-Received-Date: Wed, 23 Jun 2021 21:17:41 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 15:09-20210623, Denys Dmytriyenko wrote:
> I'd suggest moving out such old "legacy" configs up till at least Rocko into a 
> separate folder (if not remove completely):
> 
> Rocko
> Pyro
> Morty
> Krogoth
> Jethro
> Fido
> Dizzy
> Daisy
> Dora
> Dylan
> Danny
> Denzil
> 
> E.g. "Denzil" was released all the way back in 2012!
> https://wiki.yoctoproject.org/wiki/Releases
> 

OK, I was in two minds about this.. so decided to go the conservative
route.

Instead of crufty old configs, Lets just keep current active supported
releases (dunfell and above as they appear). Git already has history
if need be. For folks on specific releases, the release configs are
already available.


Will respin..

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

