Return-Path: <dmurphy@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id ED4FA529D4
	for <meta-arago@arago-project.org>;
	Fri, 11 Dec 2020 13:39:05 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BBDcxq4070331
	for <meta-arago@arago-project.org>; Fri, 11 Dec 2020 07:38:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607693939;
	bh=ne3yiDn8L2IbmwYiUBVdxmzGVGxjDwcBbG2qy43vW44=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=D/bRPWfZFJa39fSf9V1ZNL3lkW+RdHSkPfHpZES6+GTv/I3m7L4JVLS5LW548A/Fw
	tMy1x78WlBUkjOdOuzZg32ZVVMc40YtFYm5r0qzElTvUpPYn2CurzwEi5SUv+W7Vdh
	SSg7lysEiqkKw+4XaG5lIx442UkWiEjLTdM5DTvE=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BBDcx9S112781
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 11 Dec 2020 07:38:59 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Fri, 11 Dec 2020 07:38:59 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Fri, 11 Dec 2020 07:38:59 -0600
Received: from [10.250.70.26] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BBDcw0B018294;
	Fri, 11 Dec 2020 07:38:58 -0600
To: Caleb Robey <c-robey@ti.com>, <meta-arago@arago-project.org>
References: <20201209191815.22466-1-c-robey@ti.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <f57909e8-1617-1ab2-c84e-de7f702ff5b9@ti.com>
Date: Fri, 11 Dec 2020 07:38:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201209191815.22466-1-c-robey@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: a0232989 <a0232989@ti.com>, a0132237 <a0132237@ti.com>
Subject: Re: [PATCH] [meta-ti][dunfell/master][PATCH] set serverip after dhcp
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
X-List-Received-Date: Fri, 11 Dec 2020 13:39:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Caleb

On 12/9/20 1:18 PM, Caleb Robey wrote:
> From: a0232989 <a0232989@ti.com>

Please use your name here

And fix up the $subject line

Dan


