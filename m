Return-Path: <dmurphy@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 1A11D520E5
	for <meta-arago@arago-project.org>;
	Wed,  7 Oct 2020 16:12:53 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 097G9qg9111131
	for <meta-arago@arago-project.org>; Wed, 7 Oct 2020 11:09:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1602086992;
	bh=PmJ13AsiyuL0dM4ech+rt54WNPYiSlNIoaNwMWzS3jg=;
	h=Subject:From:To:CC:References:Date:In-Reply-To;
	b=wjdazUxhRlsWSKH7Qui+e45wIefmbcK/iZJlH8T+mRDEXXg7E2Pl64Oo26oFr1Mbi
	kk2qqMVJEOE4rn/T5xkSXk8oUy+BC8sBpbj72Okli+a6kXrHw+O33mio/I9c81Up5r
	He+fSRIQEEDUUR9u9e/tXwA6rUAJOBfj9xzh/V64=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 097G9qNf016891
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 7 Oct 2020 11:09:52 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Wed, 7 Oct 2020 11:09:51 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Wed, 7 Oct 2020 11:09:51 -0500
Received: from [10.250.39.105] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 097G9pkM081354;
	Wed, 7 Oct 2020 11:09:51 -0500
From: Dan Murphy <dmurphy@ti.com>
To: Denys Dmytriyenko <denys@ti.com>, Aparna Balasubramanian <aparnab@ti.com>
References: <20201007155758.32716-1-aparnab@ti.com>
	<20201007155930.GF23230@beryl>
	<caaef03a-df12-9bb2-e65b-64d06f1c7971@ti.com>
Message-ID: <098bd7dc-5d2a-38da-a78f-8e98c7c32a41@ti.com>
Date: Wed, 7 Oct 2020 11:09:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <caaef03a-df12-9bb2-e65b-64d06f1c7971@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] ltp-ddt: Update to latest
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
X-List-Received-Date: Wed, 07 Oct 2020 16:12:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Aparna

On 10/7/20 11:02 AM, Dan Murphy wrote:
> Denys
>
> On 10/7/20 10:59 AM, Denys Dmytriyenko wrote:
>> Looks good, thanks.
> How about a reviewed-by?
> ______


applied to -next

Dan


> _________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

