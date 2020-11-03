Return-Path: <s-anna@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id C243A529C9
	for <meta-arago@arago-project.org>;
	Tue,  3 Nov 2020 17:08:45 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A3H5bvv066305
	for <meta-arago@arago-project.org>; Tue, 3 Nov 2020 11:05:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1604423137;
	bh=1Hm/eLqqjY6/x7pQz/h+jBOtJ/1gv+tfHbNf9Ce39go=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=LSpCfMN4FpCN4GBAesMzpH84B8Iub0SNBFzSK8CdHYPOrBIlgd33LtSU7M5rumZ25
	7tuDEAKu5Fkuwt6p0pNNCxH2jIVvJ/yc2zhOS4o+o2PjMvFtnpA8YwERLpBsP/asBE
	aRC6/Gqsp9YER1uPAl9isJWdSsUn+NYLAusIVz0k=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A3H5bOJ033668
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 3 Nov 2020 11:05:37 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Tue, 3 Nov 2020 11:05:37 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Tue, 3 Nov 2020 11:05:37 -0600
Received: from [10.250.64.255] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A3H5amg121904;
	Tue, 3 Nov 2020 11:05:36 -0600
To: Dan Murphy <dmurphy@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
	<denys@ti.com>, <aparnab@ti.com>
References: <20201102143757.12208-1-nikhil.nd@ti.com>
	<20201103164227.5st3eaqx2f36mmoh@NiksLab>
	<b9d31a4f-a3c8-d7db-8239-1383283a6415@ti.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <dd1ed257-6b69-0203-c9a8-e6b27843e575@ti.com>
Date: Tue, 3 Nov 2020 11:05:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b9d31a4f-a3c8-d7db-8239-1383283a6415@ti.com>
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
X-List-Received-Date: Tue, 03 Nov 2020 17:08:46 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/3/20 10:43 AM, Dan Murphy wrote:
> Nikhil
> 
> On 11/3/20 10:42 AM, Nikhil Devshatwar wrote:
>> On 20:07-20201102, Nikhil Devshatwar wrote:
>>> statcol is an application which collects the statistical data from
>>> various sources and allows to visualize it on the host machine using
>>> web sockets.
>>> Include this in the filesystem via arago-tisdk-addons packagegroup.
>>>
>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>> Hi Dan, This is required for 7.1 release.
> 
> What makes this required for the 7.1 release?

It is a committed requirement, and was dependent on the ti-rpmsg-char stuff.

regards
Suman

