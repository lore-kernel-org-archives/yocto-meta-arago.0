Return-Path: <nikhil.nd@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 81335520E2
	for <meta-arago@arago-project.org>;
	Mon,  7 Oct 2019 11:12:30 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x97BBH6h074843
	for <meta-arago@arago-project.org>; Mon, 7 Oct 2019 06:11:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1570446677;
	bh=3XdnsAIxvHcJQcH5zKqEa1LdijGoZe6LekFE2t8M208=;
	h=Subject:From:To:References:Date:In-Reply-To;
	b=xkt8+nYiHCsnEY5HzaofiE9J+HP8wKDCC5w9dAE1ypWuPXhHaai3eUK6w9dOlFgzy
	+atr4+NY/YIRXv/0QMEglALcO+39HO6srWm3SNX0xeROa7S3tq16px44qGUq5CXx+s
	iyB+3cZI+cRpdSWtI5ayVAryyQ0vpVzHjnQWQZGA=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x97BBHZl127107
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 7 Oct 2019 06:11:17 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 7 Oct 2019 06:11:15 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 7 Oct 2019 06:11:15 -0500
Received: from [172.24.190.110] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97BBFIs093614;
	Mon, 7 Oct 2019 06:11:15 -0500
From: Nikhil Devshatwar <a0132237@ti.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>, <meta-arago@arago-project.org>,
	Denys Dmytriyenko <denys@ti.com>, Jacob Stiffler <j-stiffler@ti.com>
References: <1569940366-184916-1-git-send-email-nikhil.nd@ti.com>
	<a686ea51-dae2-f6f5-91a1-9daa08dfb41b@ti.com>
Message-ID: <e3a8c2b5-fce9-f660-4ffa-9efb43ffbf8b@ti.com>
Date: Mon, 7 Oct 2019 16:41:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <a686ea51-dae2-f6f5-91a1-9daa08dfb41b@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [tisdk-setup-scripts] [PATCH v1] setup-package-install: Add flex and libssl-dev packages
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
X-List-Received-Date: Mon, 07 Oct 2019 11:12:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 03/10/19 7:04 PM, Nikhil Devshatwar wrote:
> On 01/10/19 8:02 PM, Nikhil Devshatwar wrote:
>> For building kernel binaries, host machine should have flex and
>> libssl-dev packages installed.
>>
>> Add these to list of packages.
>>
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ping
Jacob/Denys,
Please merge this

Nikhil D

>
> Nikhil D
>> ---
>>   setup-package-install.sh | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/setup-package-install.sh b/setup-package-install.sh
>> index 1e9fedb..922e504 100644
>> --- a/setup-package-install.sh
>> +++ b/setup-package-install.sh
>> @@ -56,7 +56,7 @@ cwd=`dirname $0`
>>     entry_header
>>   -packages_to_install="xinetd tftpd nfs-kernel-server minicom build-essential libncurses5-dev autoconf automake dos2unix screen lrzsz lzop"
>> +packages_to_install="xinetd tftpd nfs-kernel-server minicom build-essential libncurses5-dev autoconf automake dos2unix screen lrzsz lzop flex libssl-dev"
>>     get_major_host_version host_major_version
>


