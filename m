Return-Path: <m-karicheri2@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 4EC0552970
	for <meta-arago@arago-project.org>;
	Thu,  6 Aug 2020 13:48:51 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 076Dk4hM098441
	for <meta-arago@arago-project.org>; Thu, 6 Aug 2020 08:46:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1596721565;
	bh=j/CP0OFAtcATjFsUL/ejDPPiHml+EVYEaf1NZ87FJHs=;
	h=Subject:From:To:CC:References:Date:In-Reply-To;
	b=KMPugbl3o//HAji64IHHgD+Vx3uV4OhlwsgWGg+Q3e38UVCg4cg9c5HPuyCBnXHOG
	6wsGViznogp1c0rRAQKa/zGdM8aYyu0CrJG8/34u8e/NbAoVjGv8lXkl9VvucSD/aW
	/iQLmjy9gWT2d0HZE3n5q8AvRI5RF7icWOOXVTvc=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 076Dk4pS079660
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 6 Aug 2020 08:46:04 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 6 Aug 2020 08:46:04 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 6 Aug 2020 08:46:04 -0500
Received: from [10.250.53.226] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 076Dk3lh028132;
	Thu, 6 Aug 2020 08:46:04 -0500
From: Murali Karicheri <m-karicheri2@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, <meta-arago@arago-project.org>,
	"Balasubramanian, Aparna" <aparnab@ti.com>
References: <mailman.5549.1596575976.11489.meta-arago@arago-project.org>
	<d2bf4b45-c9df-a544-bf4e-06b91a5db4b5@ti.com>
Message-ID: <940400d8-c939-9ebd-038b-57bae1731401@ti.com>
Date: Thu, 6 Aug 2020 09:45:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d2bf4b45-c9df-a544-bf4e-06b91a5db4b5@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Sekhar Nori <nsekhar@ti.com>
Subject: Re: Net-SNMP
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
X-List-Received-Date: Thu, 06 Aug 2020 13:48:51 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Denys,

On 8/6/20 8:46 AM, Murali Karicheri wrote:
> Hi Denys,
> 
> This was a single patch in Processor SDK to add IEC-62439-3 MIB support
> . This was held up because the size limit is exceeded. I can split in to
> multiple patches and re-send. Do I need to do anything else?
> 
> Also wondering why the base net-snmp is not part of the core SDK. There
> was a requirement I have added sometime back to have the base Net-SNMP
> part of the file system. Other than this patch, is there any other
> update needed (Package group) to include Net-SNMP in the file system.
> I see 
> ./meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb 
> has net-snmp. So does it mean net-snmp is expected
> to be already part of the SDK 7.1 file system?
> 
> As a first step I would like to have interfaces MIB working which list
> all network interfaces in the system. What should I do it get it
> enabled?
> 
> Aparna, could you help me locate the Net-SNMP requirement? Do you have
> any info on if net-snmp is part of 7.1?
Looks like part of the net-snmp packages are available in
the SDK. For example I see

root@am57xx-evm:~# snmp
snmp-bridge-mib  snmpconf         snmpgetnext      snmpps 
snmptest         snmpusm
snmpbulkget      snmpdelta        snmpinform       snmpset 
snmptop          snmpvacm
snmpbulkwalk     snmpdf           snmpnetstat      snmpstatus 
snmptranslate    snmpwalk
snmpcheck        snmpget          snmpping         snmptable 
snmptrap
root@am57xx-evm:~# snmpd
-sh: snmpd: command not found

So I am not sure what is the current state of Net-SNMP in the filesystem
and need help.

Murali
> 
> Thanks
> 
> Murali
> On 8/4/20 5:19 PM, meta-arago-bounces@arago-project.org wrote:
>> Your mail to 'meta-arago' with the subject
>>
>>      [PATCH] net-snmp: update recipe for IEC-62439-3 MIB used in
>> HSR/PRP protocols
>>
>> Is being held until the list moderator can review it for approval.
>>
>> The reason it is being held:
>>
>>      Message body is too big: 2843957 bytes with a limit of 100 KB
>>
>> Either the message will get posted to the list, or you will receive
>> notification of the moderator's decision.  If you would like to cancel
>> this posting, please visit the following URL:
>>
>>      
>> http://arago-project.org/cgi-bin/mailman/confirm/meta-arago/4a672f9a16205bed61aa52c9cadc382f58138d79 
>>
>>
> 

-- 
Murali Karicheri
Texas Instruments

