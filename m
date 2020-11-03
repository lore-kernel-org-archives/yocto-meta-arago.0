Return-Path: <dmurphy@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id C096D529C9
	for <meta-arago@arago-project.org>;
	Tue,  3 Nov 2020 16:46:55 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A3GhlqY048952
	for <meta-arago@arago-project.org>; Tue, 3 Nov 2020 10:43:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1604421827;
	bh=5bxFSnu1dVLAYuoSKdrhZ2OUrk/afJXvpxk6Jhdqstk=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=fUCLtq5bacbCyhOUJ0MtE+Q61WY2cd0VyeiyutSq5SZ3SDuwYnNJ0dsfOy/AHHjI5
	XQKV/LaIC1wGWMKDs8q+RKeWxWWZBm7qa9OEGrZSF6XlQPJf04X+EzEKkJkxSyC6E0
	VgWtSYWUWVIEzKd6Z6YwGx6EFlqie3ouUprz+7uA=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A3Ghlbs102768
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 3 Nov 2020 10:43:47 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Tue, 3 Nov 2020 10:43:47 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Tue, 3 Nov 2020 10:43:47 -0600
Received: from [10.250.36.55] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A3GhlFV101267;
	Tue, 3 Nov 2020 10:43:47 -0600
To: Nikhil Devshatwar <nikhil.nd@ti.com>, <denys@ti.com>, <aparnab@ti.com>
References: <20201102143757.12208-1-nikhil.nd@ti.com>
	<20201103164227.5st3eaqx2f36mmoh@NiksLab>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <b9d31a4f-a3c8-d7db-8239-1383283a6415@ti.com>
Date: Tue, 3 Nov 2020 10:43:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201103164227.5st3eaqx2f36mmoh@NiksLab>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [dunfell PATCH] packagegroup: arago-tisdk-addons: Include statcol for k3 devices
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
X-List-Received-Date: Tue, 03 Nov 2020 16:46:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Nikhil

On 11/3/20 10:42 AM, Nikhil Devshatwar wrote:
> On 20:07-20201102, Nikhil Devshatwar wrote:
>> statcol is an application which collects the statistical data from
>> various sources and allows to visualize it on the host machine using
>> web sockets.
>> Include this in the filesystem via arago-tisdk-addons packagegroup.
>>
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> Hi Dan, This is required for 7.1 release.

What makes this required for the 7.1 release?

Dan


