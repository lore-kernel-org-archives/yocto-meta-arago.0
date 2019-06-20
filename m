Return-Path: <anandb@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 468E45297F
	for <meta-arago@arago-project.org>;
	Thu, 20 Jun 2019 09:07:44 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5K972lX100535
	for <meta-arago@arago-project.org>; Thu, 20 Jun 2019 04:07:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561021622;
	bh=QCvIjkYjIG7O5DXx1R7QSvvMGU3P7GT0hqofPhV8rsI=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=YZc12KDPlpgImiB+xWzVxNu3x4MWCFbljJf42pGqCw94Gc+hbYQ4D27H47Ti1QB1V
	e76QCCbous9Ts/NRvn/FxhNz+7vK4PyJZax6xS/iqBZQ4dx/NzNUFMvkHPagl34TOQ
	LV0tEtbMXPqGbQkRI+PnzzedNMTE8+2ddP4Xs9O8=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5K972Ix029729
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 20 Jun 2019 04:07:02 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 20 Jun 2019 04:07:02 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 20 Jun 2019 04:07:02 -0500
Received: from [172.24.147.151] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5K96xBD033969;
	Thu, 20 Jun 2019 04:07:00 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <1560946434-45648-1-git-send-email-anandb@ti.com>
	<20190619192645.GN32001@beryl>
From: Anand Balagopalakrishnan <anandb@ti.com>
Message-ID: <ef3a2e49-5425-4f1c-7271-5310c7239264@ti.com>
Date: Thu, 20 Jun 2019 14:36:51 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190619192645.GN32001@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [[thud] PATCH] libdrm: add support for sync info
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
X-List-Received-Date: Thu, 20 Jun 2019 09:07:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20/06/19 12:56 AM, Denys Dmytriyenko wrote:
> What are the upstream plans for these patches?
There are no upstream plans. At a later point, if we move to our libsync 
implementation, these patches could go away. Till then, we need to carry 
the patches.

I can add a note to this effect in the commit log.

> 
> 
> On Wed, Jun 19, 2019 at 05:43:54PM +0530, Anand Balagopalakrishnan wrote:
>> Add support functions to provide sync and fence info. These patches are
>> needed for Rogue GPU driver which leverages dmabuf fence for synchronization.
>>
>> Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>

-- 

Regards,
Anand

