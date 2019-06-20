Return-Path: <anandb@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 9C7B052972
	for <meta-arago@arago-project.org>;
	Thu, 20 Jun 2019 09:16:15 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5K9FXot117214
	for <meta-arago@arago-project.org>; Thu, 20 Jun 2019 04:15:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561022133;
	bh=DdA0y8XBV4BXZu1EPeXjYZpIFCCOXSM7TbXvy1zafmg=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=oW8+rucwch/302QfxJMwKl8fnzbqkfSzKtUVRf8IwZctIB1l+qccLQ3hiQOlHEhJc
	Ub7qHZQVqZ9vr9BDzsJ+1dpJUPggkwCrFEPOhCTUFArAHlvaZCYQoa4Huxe7ziae1V
	puvb1NS3QGY/JZfyKjBM3dP/VBSyiPxiUJyXWOXo=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5K9FX4i077636
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 20 Jun 2019 04:15:33 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 20 Jun 2019 04:15:33 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 20 Jun 2019 04:15:33 -0500
Received: from [172.24.147.151] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5K9FVvt094217;
	Thu, 20 Jun 2019 04:15:32 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <1560960696-17318-1-git-send-email-anandb@ti.com>
	<20190619182041.GG32001@beryl> <20190619182154.GH32001@beryl>
From: Anand Balagopalakrishnan <anandb@ti.com>
Message-ID: <5837b873-0287-1ba7-2cd7-9a6cf312b90f@ti.com>
Date: Thu, 20 Jun 2019 14:45:24 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190619182154.GH32001@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [[thud] PATCH 1/1] linux-ti-staging: update to latest version
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
X-List-Received-Date: Thu, 20 Jun 2019 09:16:16 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19/06/19 11:51 PM, Denys Dmytriyenko wrote:
> Oh, and this is the wrong list for this...
Ah, yes. I see that you already have a patch for updating the kernel on 
meta-ti.

Regards,
Anand

