Return-Path: <dmurphy@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 786EF529D2
	for <meta-arago@arago-project.org>;
	Thu, 11 Feb 2021 12:39:24 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 11BCdXfg072016
	for <meta-arago@arago-project.org>; Thu, 11 Feb 2021 06:39:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1613047173;
	bh=JCr4gkZoNFHKAzu3OUtt4RQ1gNnPBkPBQ6Hrty1vDfs=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=eDluRegcyot1Rol/2MKAbun8G2zR7iynzqveKP2KBYomOczmlFlTnXLGjbefcqAyi
	gdzg430ZKeZpvAzRVqQ0McsWtTAjZ5A6ldayP3e6jDW87N95WlNXJR04zdG6xdsk6I
	qft+Ve5H/2eJqk2oA5zaTO+UJma+mWoPV16IXwxI=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 11BCdXGu075991
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 11 Feb 2021 06:39:33 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 11 Feb 2021 06:39:32 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 11 Feb 2021 06:39:32 -0600
Received: from [10.250.34.61] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 11BCdWus089580;
	Thu, 11 Feb 2021 06:39:32 -0600
To: Nikhil Devshatwar <nikhil.nd@ti.com>, <meta-arago@arago-project.org>
References: <20210211110555.25570-1-nikhil.nd@ti.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <0756684e-5cfc-699d-d239-f68fdd4dd939@ti.com>
Date: Thu, 11 Feb 2021 06:39:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210211110555.25570-1-nikhil.nd@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: lokeshvutla@ti.com, nsekhar@ti.com, kishon@ti.com
Subject: Re: [meta-ti][dunfell PATCH] packagegroup: tisdk-connectivity: Include wireless firmware for am64xx-sk
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
X-List-Received-Date: Thu, 11 Feb 2021 12:39:24 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Nikhil

On 2/11/21 5:05 AM, Nikhil Devshatwar wrote:
> Use the new recipe to install the wireless firmwares in the
> filesystem for am64xx-sk

Not a show stopper and no reason to re-submit but $subject says meta-ti 
this is the meta-arago list.

Dan



