Return-Path: <nm@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 8F2A152ACE
	for <meta-arago@arago-project.org>;
	Mon,  7 Jun 2021 21:22:46 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 157LNSPA025416
	for <meta-arago@arago-project.org>; Mon, 7 Jun 2021 16:23:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1623101008;
	bh=h4BJomDab85rdC4znE+7C3ktnr5bg8L8wKvZIzDaGc4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=OojaTLzseiopiz4lR7LyemKAOCK+I4rMo1Q3lryVfZJ06QOoEAvTgQgkF40pkKnrm
	UdQk4Hd5qWuKVVM+BrKDv4wRiVt8SGsocMhTOqQb0XdS586J+ai0aQyHcEG1AkVCJ5
	ez6r4F4YR3CIbz+0c11mB+GsmdfXWY5R3csEbUhs=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 157LNReq049844
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 7 Jun 2021 16:23:28 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Mon, 7 Jun 2021 16:23:27 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Mon, 7 Jun 2021 16:23:27 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 157LNRLO105697;
	Mon, 7 Jun 2021 16:23:27 -0500
Date: Mon, 7 Jun 2021 16:23:27 -0500
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <20210607212327.nejfsndlcwnpogpo@decorator>
References: <20210603032020.23448-1-a-m1@ti.com>
	<092132a2-c918-b0c6-ca4d-82239523dc6a@ti.com>
MIME-Version: 1.0
In-Reply-To: <092132a2-c918-b0c6-ca4d-82239523dc6a@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago PATCH] tisdk-core-bundle: Install sysfw.itb in the prebuilt-images directory
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
X-List-Received-Date: Mon, 07 Jun 2021 21:22:46 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 14:26-20210603, Vignesh Raghavendra wrote:
> +praneeth
> 
> On 6/3/21 8:50 AM, Aparna M wrote:
> > Install the sysfw.itb file in the prebuilt images directory of the
> > tisdk-core-bundle package.
> > 
> 
> Why do we need to package sysfw.itb given that its already part of
> tiboot3.bin in case of am64x?


NAK. We are using multi-certificate for am64x.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

