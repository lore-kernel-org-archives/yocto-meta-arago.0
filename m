Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 546B652A10
	for <meta-arago@arago-project.org>;
	Tue, 10 Dec 2019 18:53:38 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBAIq4D3056943
	for <meta-arago@arago-project.org>; Tue, 10 Dec 2019 12:52:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576003924;
	bh=WaqclJBcqYwQ/fJ9+IXgtEli6iRGBGHGOV7vqErhL88=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=oJTojO6M/CHnyxydcX2a+mVyviPe5ipbbv5NV5EITfq5WWk/0ooCJwdGAHZ9xuvej
	oz5FIS/mKq3Cqsa7VwU9fLU1sBt7iyq0T3eHiJF3T9EYjI2P2ebF+QDG9s7jyS5eI1
	GL7iKwMjjBgQ0qDB+r1Uuby4zWQtGHU2YpYnxs0s=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBAIq3c8024942
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 10 Dec 2019 12:52:04 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 10 Dec 2019 12:52:03 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Tue, 10 Dec 2019 12:52:03 -0600
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBAIq2SI019203;
	Tue, 10 Dec 2019 12:52:02 -0600
To: Nikhil Devshatwar <a0132237@ti.com>, <meta-arago@arago-project.org>
References: <20191209083443.3598-1-a0132237@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <d0eff43d-08e7-ffdc-4ba5-de2567485490@ti.com>
Date: Tue, 10 Dec 2019 13:52:01 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191209083443.3598-1-a0132237@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [tisdk-setup-scripts][PATCH v1] setup-targetfs-nfs: Update command to replace Rules.make variables
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
X-List-Received-Date: Tue, 10 Dec 2019 18:53:38 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

This has been pushed to master.


Thank you,

Jake

On 12/9/2019 3:34 AM, Nikhil Devshatwar wrote:
> Update the setup-targetfs-nfs.sh to replace Rules.make variables
> so that they are initialized conditionally.
>
> Signed-off-by: Nikhil Devshatwar <a0132237@ti.com>
> ---
>   setup-targetfs-nfs.sh | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/setup-targetfs-nfs.sh b/setup-targetfs-nfs.sh
> index 60817ca..ac1611c 100644
> --- a/setup-targetfs-nfs.sh
> +++ b/setup-targetfs-nfs.sh
> @@ -145,10 +145,10 @@ echo "EXEC_DIR or DESTDIR variable (depending on your SDK)."
>   echo
>   read -p "Press return to continue" REPLY
>   
> -sed -i "s=EXEC_DIR\=.*$=EXEC_DIR\=$dst/home/root/$platform=g" $cwd/../Rules.make
> +sed -i "s=EXEC_DIR ?\=.*$=EXEC_DIR ?\=$dst/home/root/$platform=g" $cwd/../Rules.make
>   check_status
>   
> -sed -i "s=DESTDIR\=.*$=DESTDIR\=$dst=g" $cwd/../Rules.make
> +sed -i "s=DESTDIR ?\=.*$=DESTDIR ?\=$dst=g" $cwd/../Rules.make
>   check_status
>   
>   echo "Rules.make edited successfully.."

