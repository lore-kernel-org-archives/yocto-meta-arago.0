Return-Path: <jjhiblot@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id E473952961
	for <meta-arago@arago-project.org>;
	Wed, 11 Oct 2017 18:05:07 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9BI57nR009276
	for <meta-arago@arago-project.org>; Wed, 11 Oct 2017 13:05:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507745107;
	bh=27LbbOpP+xv1PsgWUFU8XoD1RGHhhVltb3jdNC5V3do=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=Kx7AfAE1wU1DyqzVltA3fCXCV9k3PYUbenzPZE8lnFFV2T7uWWHuwd1Cx0yIzuEDE
	xCtDikCkx0Xx7/Jzdu3fRHap3oJGdEtZU2IdJOcviB3aXb0mryVdw9CL/uxzoWsZk7
	LLboQ48KrDceZ1FX9rolnmfv0MdbXH+oSAONTgS4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9BI57WJ014413
	for <meta-arago@arago-project.org>; Wed, 11 Oct 2017 13:05:07 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 11 Oct 2017 13:05:07 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 11 Oct 2017 13:05:07 -0500
Received: from [172.22.128.186] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9BI56mZ021749;
	Wed, 11 Oct 2017 13:05:07 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <1507744725-32713-1-git-send-email-jjhiblot@ti.com>
	<20171011180207.GU16210@edge>
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <d8ba8fb8-5ae4-ff28-0de7-3a69c5871630@ti.com>
Date: Wed, 11 Oct 2017 20:05:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171011180207.GU16210@edge>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [krogoth] [PATCH 1/2] can-utils: update to the latest
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
X-List-Received-Date: Wed, 11 Oct 2017 18:05:08 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 11/10/2017 20:02, Denys Dmytriyenko wrote:
> Are these 2 backports from morty? Please keep original commit logs then.
Yes they are backports from morty?

Do you want me to resend?

JJ

>
>
> On Wed, Oct 11, 2017 at 07:58:44PM +0200, Jean-Jacques Hiblot wrote:
>> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
>> ---
>>   meta-arago-distro/recipes-extended/socketcan/can-utils_git.bbappend | 3 +++
>>   1 file changed, 3 insertions(+)
>>   create mode 100644 meta-arago-distro/recipes-extended/socketcan/can-utils_git.bbappend
>>
>> diff --git a/meta-arago-distro/recipes-extended/socketcan/can-utils_git.bbappend b/meta-arago-distro/recipes-extended/socketcan/can-utils_git.bbappend
>> new file mode 100644
>> index 0000000..c0e6666
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-extended/socketcan/can-utils_git.bbappend
>> @@ -0,0 +1,3 @@
>> +SRCREV = "5b518a0a5fa56856f804372a6b99b518dedb5386"
>> +
>> +PR_append = ".arago0"
>> -- 
>> 1.9.1
>>


