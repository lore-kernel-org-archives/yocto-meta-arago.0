Return-Path: <yogeshs@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id F0923529B2
	for <meta-arago@arago-project.org>;
	Fri, 20 Aug 2021 01:00:30 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17K10rnM074547;
	Thu, 19 Aug 2021 20:00:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1629421253;
	bh=pu/mT2Qe7nVxGCe4rRkzC0rBaxy4xQoIaN+zAbjrzr0=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=GlfbJ0Ov+hjK4kmqBQFyNBByn+Y4qcFUq6n9uRZZOH/KfzqF1Hg9F6C2v7UXQM7/q
	hZQGkLGvkhpb1KfDDqAP2Vzqa7Ym8sqqGkwS91WunHA1dcxe9d10asgYhWu+geI42y
	zA4mr5KK7byZHZ3uYLOTEqQtrrKgWtUe82ZyOuX4=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17K10rPG015671
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Aug 2021 20:00:53 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Thu, 19 Aug 2021 20:00:52 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Thu, 19 Aug 2021 20:00:53 -0500
Received: from [10.250.39.223] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17K10qXh073539;
	Thu, 19 Aug 2021 20:00:52 -0500
To: Paul Barker <paul@pbarker.dev>, <meta-arago@arago-project.org>, Praneeth
	Bajjuri <praneeth@ti.com>
References: <20210819165755.6156c40c.paul@pbarker.dev>
From: "Siraswar, Yogesh" <yogeshs@ti.com>
Message-ID: <ca2676c6-045f-cff2-1f52-15a18328b3ea@ti.com>
Date: Thu, 19 Aug 2021 20:00:52 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210819165755.6156c40c.paul@pbarker.dev>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: Rebase of oe-layersetup?
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
X-List-Received-Date: Fri, 20 Aug 2021 01:00:31 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Paul,
I guess you are still using oe-layersetup from 
https://arago-project.org. Since arago-project.org will be sunset in 
mid-2022 we are migrating to 
https://git.ti.com/cgit/arago-project/oe-layersetup.
There was sync issue with git.ti.com that resulted in force-update.
Could you please start using 
https://git.ti.com/cgit/arago-project/oe-layersetup so that you do not 
see any disruption when arago-project.org is sunset.

Thanks
Yogesh

On 8/19/2021 10:57 AM, Paul Barker wrote:
> Hi folks,
> 
> Was there a force push or rebase of the master branch of the
> oe-layersetup repository?
> 
> I previously had commit efa23526343a48255bc0cf566ecd9e4fd625ba89
> "processor-sdk: Add 08.00.00.21 release config". It looks like this has
> been stripped out and instead the HEAD of master is now
> d7c7f2cf567448ef0e2e0bb8d98f819856a96c0d "processor-sdk: Add
> 08.00.00.21 release config". Both commits have their parent as
> 60df5effd05fbe42fe3b3a5806eb5cac161e51cc "coresdk-08.00.00.004-config:
> add config for CoreSDK 08.00.00.004 release".
> 
> This has broken the automatic update of my copy of the oe-layersetup
> repository so I'd like to confirm which commit is the correct HEAD and
> if it did change then why did it change?
> 
> Thanks,
> 

