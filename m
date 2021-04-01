Return-Path: <nm@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 9ED6B52CB8
	for <meta-arago@arago-project.org>;
	Thu,  1 Apr 2021 21:53:12 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 131LrXCZ009381;
	Thu, 1 Apr 2021 16:53:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617314013;
	bh=LW+4JpPJmir+M3l9CacI0LToZ1x1heuFtYTzVlQH3CI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Dtw/j9WFv5fN9WQrSS7R+Fk6YJT58gLsQZ1y5lXW08NfnnhY2VSs8/P6c4/qvXC0b
	EPqQYL6c+7AUj5HMz8vlWbO5AElMjT6L9gNU+uptDRLYW1EoQ9Dj9s7In9cbSGMZvD
	xuWicLXCkqAKlcHEiJkvoznRat5Tl3zXzjf8ndbM=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 131LrXjQ049410
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Apr 2021 16:53:33 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Thu, 1 Apr 2021 16:53:33 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Thu, 1 Apr 2021 16:53:33 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 131LrWlj079193;
	Thu, 1 Apr 2021 16:53:32 -0500
Date: Thu, 1 Apr 2021 16:53:32 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20210401215332.of5otxexiw2ekdvw@recycler>
References: <1617312217-14991-1-git-send-email-denis@denix.org>
	<1617312217-14991-7-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1617312217-14991-7-git-send-email-denis@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [dunfell/master][PATCH 6/7] ti-test: disable cmem, omapdrmtest, ti-ipc, llds for mainline brand
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
X-List-Received-Date: Thu, 01 Apr 2021 21:53:13 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 17:23-20210401, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> These components require drivers that are not upstream (cmem, uio, rpmsg...)
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>

Thanks. we need to revisit the ti-test package group a bit later on...
for example a ramdisk system and 2G DDR - such as those on am64, kinda
hard to get the full package group in.. might be something for us to
chew on later on, I guess..
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

