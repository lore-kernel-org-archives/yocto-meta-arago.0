Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 23F0452981
	for <meta-arago@arago-project.org>;
	Tue,  6 Nov 2018 14:30:11 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wA6EU0bt018512
	for <meta-arago@arago-project.org>; Tue, 6 Nov 2018 08:30:00 -0600
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wA6EU0JB072442
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 6 Nov 2018 08:30:00 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 6 Nov 2018 08:30:00 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 6 Nov 2018 08:30:00 -0600
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wA6ETxH5010662
	for <meta-arago@arago-project.org>; Tue, 6 Nov 2018 08:30:00 -0600
To: <meta-arago@arago-project.org>
References: <1540907045-1534-1-git-send-email-j-stiffler@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <55f039c6-e736-2aef-3e60-25851e8549b9@ti.com>
Date: Tue, 6 Nov 2018 09:29:59 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1540907045-1534-1-git-send-email-j-stiffler@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [tisdk-build-scripts][PATCH] tisdk.xml: add Ubuntu 18.04 to recommended distros
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
X-List-Received-Date: Tue, 06 Nov 2018 14:30:12 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Ping.

On 10/30/2018 9:44 AM, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>   installer-files/tisdk.xml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/installer-files/tisdk.xml b/installer-files/tisdk.xml
> index e763f1e..52f235f 100644
> --- a/installer-files/tisdk.xml
> +++ b/installer-files/tisdk.xml
> @@ -70,7 +70,7 @@
>               <title>Linux Environment Support Message</title>
>               <description></description>
>               <explanation></explanation>
> -            <value>It is highly recommend that the user, or especially new users, install this SDK into a Ubuntu 14.04 or Ubuntu 16.04 distribution environment. This is the environment that was used to develop and test this SDK.
> +            <value>It is highly recommend that the user, or especially new users, install this SDK into a Ubuntu 14.04, Ubuntu 16.04, or Ubuntu 18.04 distribution environment. This is the environment that was used to develop and test this SDK.
>   
>   Please note that this suggestion does not prevent the SDK from installing on other Linux Distributions.</value>
>               <default></default>

