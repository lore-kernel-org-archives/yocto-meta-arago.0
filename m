Return-Path: <m-karicheri2@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 19E6A52970
	for <meta-arago@arago-project.org>;
	Thu,  6 Aug 2020 12:48:56 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 076Ck9v3056535
	for <meta-arago@arago-project.org>; Thu, 6 Aug 2020 07:46:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1596717969;
	bh=tLuXj3z9dlVmQeGI2qZ1r+NX7WZlbfG1qQ9Lm/7Wdfk=;
	h=Subject:To:References:From:CC:Date:In-Reply-To;
	b=ff/Nwv67/VFoN4Z6sCq6lYArpTcdL00Rt0gVxZ6Ywp0AoaTA4vZlrJx8cXehOpAhV
	/z7WU2XbtrPdMAi++oXvLZFsfezwGhYs4mao2mDo6pFl32ig1hW84R6mNpnIBTl1xx
	z2SllCvCO3VQPnMP92jaghAjnvq7xeeNOvD8fQec=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 076Ck9xd067211
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 6 Aug 2020 07:46:09 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 6 Aug 2020 07:46:09 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 6 Aug 2020 07:46:09 -0500
Received: from [10.250.53.226] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 076Ck9JN049697;
	Thu, 6 Aug 2020 07:46:09 -0500
To: "Dmytriyenko, Denys" <denys@ti.com>, <meta-arago@arago-project.org>,
	"Balasubramanian, Aparna" <aparnab@ti.com>
References: <mailman.5549.1596575976.11489.meta-arago@arago-project.org>
From: Murali Karicheri <m-karicheri2@ti.com>
Message-ID: <d2bf4b45-c9df-a544-bf4e-06b91a5db4b5@ti.com>
Date: Thu, 6 Aug 2020 08:46:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <mailman.5549.1596575976.11489.meta-arago@arago-project.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Sekhar Nori <nsekhar@ti.com>
Subject: Net-SNMP
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
X-List-Received-Date: Thu, 06 Aug 2020 12:48:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Denys,

This was a single patch in Processor SDK to add IEC-62439-3 MIB support
. This was held up because the size limit is exceeded. I can split in to
multiple patches and re-send. Do I need to do anything else?

Also wondering why the base net-snmp is not part of the core SDK. There
was a requirement I have added sometime back to have the base Net-SNMP
part of the file system. Other than this patch, is there any other
update needed (Package group) to include Net-SNMP in the file system.
I see 
./meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb 
has net-snmp. So does it mean net-snmp is expected
to be already part of the SDK 7.1 file system?

As a first step I would like to have interfaces MIB working which list
all network interfaces in the system. What should I do it get it
enabled?

Aparna, could you help me locate the Net-SNMP requirement? Do you have
any info on if net-snmp is part of 7.1?

Thanks

Murali
On 8/4/20 5:19 PM, meta-arago-bounces@arago-project.org wrote:
> Your mail to 'meta-arago' with the subject
> 
>      [PATCH] net-snmp: update recipe for IEC-62439-3 MIB used in
> HSR/PRP protocols
> 
> Is being held until the list moderator can review it for approval.
> 
> The reason it is being held:
> 
>      Message body is too big: 2843957 bytes with a limit of 100 KB
> 
> Either the message will get posted to the list, or you will receive
> notification of the moderator's decision.  If you would like to cancel
> this posting, please visit the following URL:
> 
>      http://arago-project.org/cgi-bin/mailman/confirm/meta-arago/4a672f9a16205bed61aa52c9cadc382f58138d79
> 

-- 
Murali Karicheri
Texas Instruments

