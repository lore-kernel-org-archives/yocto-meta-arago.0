Return-Path: <nm@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 5C9D1529A2
	for <meta-arago@arago-project.org>;
	Thu,  4 Mar 2021 23:14:22 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 124NEZmI067802;
	Thu, 4 Mar 2021 17:14:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1614899675;
	bh=wLnlaLGzWVCJEIucTu/4LKqSLWBEj1z/vLd8WkgMrhM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=n1xXKtFDqugK7o4xVa5RdoixjdXD1dSxD07MbKURotCxlGWEcMPOoVjXBbDKjd6yN
	+c3VNIYeN2tvFQ52uQGBmnTzl79GbQ9oykAI0Iy6cPhhN7OHcNgwFeaXdyf7SmolyC
	nzRO8ecIHntl0NAVh9LIAWfDli48raA4IPapFo2U=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 124NEZAQ081027
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 4 Mar 2021 17:14:35 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 4 Mar 2021 17:14:34 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 4 Mar 2021 17:14:34 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 124NEYd2004884;
	Thu, 4 Mar 2021 17:14:34 -0600
Date: Thu, 4 Mar 2021 17:14:34 -0600
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20210304231434.qyeopkbutdrvohm7@elliptic>
References: <20210304065200.15811-1-nm@ti.com>
	<20210304184811.GF4892@denix.org> <20210304194836.GK4892@denix.org>
MIME-Version: 1.0
In-Reply-To: <20210304194836.GK4892@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago <meta-arago@arago-project.org>
Subject: Re: [PATCH dunfell] cryptodev: Move to 1.12 revision
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
X-List-Received-Date: Thu, 04 Mar 2021 23:14:22 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 14:48-20210304, Denys Dmytriyenko wrote:
> BTW, you'd need to ensure updating cryptodev from 1.10 to 1.12 does not affect 
> current 5.4-based builds and/or releases. I'm sure it will build fine against 
> this older kernel (most of Makefile changes), but concerned about any run-time 
> regressions (the actual code changes).

Thank you, actually you bring out a very good point here. While I know
we can create our own internal private fork of arago for upstream
component testing, I am starting to wonder if creating either of:

a) meta-ti-mainline that builds on top of meta-ti
OR
b) meta-arago-mainline on top of meta-arago

is a smarter approach - personally, I prefer (a)? While, I don't want
to end up creating too many layers, but your point is valid that I
should also be careful to not mess with folks using the meta-arago in
production environments having to deal with challenges we are trying
to flush out by testing the bleeding edge of kernel - and I'd like to
make sure TI ecosystem is able to leverage/contribute as well (an
internal fork will not be that useful)..

Any thoughts?

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

