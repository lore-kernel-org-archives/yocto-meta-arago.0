Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.13301.1646326668217026431
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 03 Mar 2022 08:57:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=yGsrE+38;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 223GvkB8011295;
	Thu, 3 Mar 2022 10:57:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1646326666;
	bh=CqRn8P86z/CWmkr/7zMfMh9amJqHMZ/3nxXu2vnKq4w=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=yGsrE+38UfuYO1hUzT5F8ZCDlWRt5lgZsGpAo4DLhFyrdQxBRv3YUDrCdOxV4Jrbb
	 VqwU7cHPAx0WDFVB71W+CboeH8lOjrSlwgfn4/42BqNJfSq9gHAx5HpLctyjDZsN40
	 kMHqZMQ1W0+7jsRMSYX+vcRhNk7ESvPJTEaCy/Lw=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 223Gvkwb036537
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 3 Mar 2022 10:57:46 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 3
 Mar 2022 10:57:45 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 3 Mar 2022 10:57:45 -0600
Received: from [10.247.28.135] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 223Gvjm7069007;
	Thu, 3 Mar 2022 10:57:45 -0600
Message-ID: <3e24f6cc-f6dd-29e0-a13a-8059d8c32b72@ti.com>
Date: Thu, 3 Mar 2022 10:57:45 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [meta-arago][dunfell][PATCH v2 0/2] update optee-client and optee-test to 3.12.0
To: Ryan Eatmon <reatmon@ti.com>, Yogesh Siraswar <yogeshs@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20220303043433.22149-1-reatmon@ti.com>
From: "praneeth" <praneeth@ti.com>
In-Reply-To: <20220303043433.22149-1-reatmon@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 3/2/2022 10:34 PM, Ryan Eatmon wrote:
> Update the optee-client and optee-test recipes to use 3.12.0.

1. Just to be clear this is only for dunfell since meta-arm is stuck on 
3.8 with dunfell whereas master moved to 3.14

2. What is the plan for optee-examples project . can we move that to the 
same version as well.

3. I see dependency with "tee-supplicant.service" , can you/yogesh 
suggest the test command used to test with this series.

> 
> Ryan Eatmon (2):
>    optee-client: update to 3.12.0
>    optee-test: update to 3.12.0
> 
> Changes from v1:
>    - subject of cover letter.
> 
>   .../recipes-security/optee/optee-client_git.bbappend       | 7 +++++++
>   .../recipes-security/optee/optee-test_git.bbappend         | 7 +++++++
>   2 files changed, 14 insertions(+)
>   create mode 100644 meta-arago-distro/recipes-security/optee/optee-client_git.bbappend
>   create mode 100644 meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
> 
