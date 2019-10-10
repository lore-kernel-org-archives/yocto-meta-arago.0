Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 0919052986
	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2019 17:16:28 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9AHFETE037127
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2019 12:15:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1570727714;
	bh=WAb5wy5UZwuzO4VcnWpMvRnmAD57BeIlsvfwpcHHR20=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=o/lN3XsFvGdgZ08mCHMjldQ9WmDO3uVNSt6sJARJY03ZqE8KzYZtxev4MnrSRj1x4
	5SYMJFvq1j1IjrIK6nCyMe92iWgY+ZpLg44OrXHjWWikGlvColOCz0fHzwPr7aIIYQ
	fU1LgBMALrVgALvfDXrkuljZq8io5SdNuX6AS07g=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9AHFEL0087119
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2019 12:15:14 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 10 Oct 2019 12:15:14 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 10 Oct 2019 12:15:14 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9AHFEnk053221;
	Thu, 10 Oct 2019 12:15:14 -0500
To: Denys Dmytriyenko <denys@ti.com>, Nikhil Devshatwar <a0132237@ti.com>
References: <1569940366-184916-1-git-send-email-nikhil.nd@ti.com>
	<a686ea51-dae2-f6f5-91a1-9daa08dfb41b@ti.com>
	<e3a8c2b5-fce9-f660-4ffa-9efb43ffbf8b@ti.com>
	<20191010031215.GB2144@beryl>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <b742b131-915a-e1be-e061-9a158f6a0c81@ti.com>
Date: Thu, 10 Oct 2019 13:15:09 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191010031215.GB2144@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
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
X-List-Received-Date: Thu, 10 Oct 2019 17:16:29 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Sorry for the delay. I have pushed this to master.

- Jake


On 10/9/2019 11:12 PM, Denys Dmytriyenko wrote:
> On Mon, Oct 07, 2019 at 04:41:14PM +0530, Nikhil Devshatwar wrote:
>> On 03/10/19 7:04 PM, Nikhil Devshatwar wrote:
>>> On 01/10/19 8:02 PM, Nikhil Devshatwar wrote:
>>>> For building kernel binaries, host machine should have flex and
>>>> libssl-dev packages installed.
>>>>
>>>> Add these to list of packages.
>>>>
>>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>> ping
>> Jacob/Denys,
>> Please merge this
> Jake should be back in the office now, so I'll leave this to him as a primary
> maintainer of tisdk-setup-scripts - I'm only secondary/backup for that repo.
>
> Denys
>
>
>> Nikhil D
>>
>>> Nikhil D
>>>> ---
>>>>    setup-package-install.sh | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/setup-package-install.sh b/setup-package-install.sh
>>>> index 1e9fedb..922e504 100644
>>>> --- a/setup-package-install.sh
>>>> +++ b/setup-package-install.sh
>>>> @@ -56,7 +56,7 @@ cwd=`dirname $0`
>>>>      entry_header
>>>>    -packages_to_install="xinetd tftpd nfs-kernel-server minicom build-essential libncurses5-dev autoconf automake dos2unix screen lrzsz lzop"
>>>> +packages_to_install="xinetd tftpd nfs-kernel-server minicom build-essential libncurses5-dev autoconf automake dos2unix screen lrzsz lzop flex libssl-dev"
>>>>      get_major_host_version host_major_version

