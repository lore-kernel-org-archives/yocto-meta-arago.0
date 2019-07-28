Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by arago-project.org (Postfix) with ESMTPS id 2104052975
	for <meta-arago@arago-project.org>;
	Sun, 28 Jul 2019 10:22:43 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id v18so55568214ljh.6
	for <meta-arago@arago-project.org>;
	Sun, 28 Jul 2019 03:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=ZkfhJwVDgH2v7Xegadi9oOQdRlfrD7cZlMYh05z7178=;
	b=L5dAyQ2dMW6uK++TLGKKyN9zOPDiVjR9hYyoZrZBgEolhvzJmBOZWwjtnFaUYLTRNv
	yF3sbh6VVkpF3DiSOdLhXVX3QX+bzHxhICa3T6zOdDaq+MmHb7IBvzEOGtW12Yfz3NW9
	BIZrQXbkzHFqMBYvfKVtMcJhnwnsEZMPU86MyrIPSADCP0CEeJCKGbbfyPFzxbjbJq+J
	P3sEnGCUhUQPylnzYMBWQOOyWqvO1w7w8bPau7HqjDOCSopJtTAXtYDDhN9APFVRwQqa
	ZSkFQr9Mis1V1oyo9Y3h7iNvcBx7BKxoBg9PXnY2zxF6vWEUSLrobPjVI2awL6sN7ZbW
	CjUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=ZkfhJwVDgH2v7Xegadi9oOQdRlfrD7cZlMYh05z7178=;
	b=GeLWbs8853HuyBP95+z8bKPWVE++7wDtaCmLJQjQpsw3NWj+pfMX5n/efJDd8UZRKe
	AWx3LVpWRzmQwTB2ssxXE/uTENubXOZI4VxpgIqEduqU9tn62Idrpcr2zuoDx1locaBt
	WoNB5HaTytj6IeKjRCOOTLZyXl7bQlyYno2Lf51KgseXgx7kTnBz00ScdfsiSIP0gV4i
	VLplgIGqlUFijZfwGsI6XLf0MRiP+FKUOD6AL4rDLaM+NmI1IxIBNAe/kOwtzoaHeof1
	6Tm8Eu+YGFBl6YMuElNnnAtzj6Do2ngE+dwNNkbGxZgXxAMzfFmXFxmc0VTQganwAXsY
	o5ZQ==
X-Gm-Message-State: APjAAAVzXI2rArQquSoG61/ynzPeEkjJBCm/i55YArsjLqdrJ7ANnjHY
	LI3W+t6/AclaaCWPQ7d8gBFGc2rCMr+w60w3TncCGQ==
X-Google-Smtp-Source: APXvYqxqxFV1LEja//cB8/gjwro0w9gyI/dBO1xJiFJ/rJrZbrNP2jnL8Nyw+/vIdpYk+tseCQzcNUT9YNbiS56clqg=
X-Received: by 2002:a2e:a171:: with SMTP id u17mr9343674ljl.209.1564309309138; 
	Sun, 28 Jul 2019 03:21:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190725052703.11313-1-ankur.tyagi85@gmail.com>
In-Reply-To: <20190725052703.11313-1-ankur.tyagi85@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sun, 28 Jul 2019 22:21:46 +1200
Message-ID: <CADySD0F3WVdq=uu9tWLeBTT=0Vc=WMgYLSETJaFbd0Mh79-wjg@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: Re: [oe-layersetup][PATCH] oe-layersetup.sh: Fix printf error if repo uri has space
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
X-List-Received-Date: Sun, 28 Jul 2019 10:22:44 -0000
Content-Type: text/plain; charset="UTF-8"

ping

regards
Ankur

On Thu, Jul 25, 2019 at 5:27 PM Ankur Tyagi <ankur.tyagi85@gmail.com> wrote:
>
> If repo uri has space, then url will have '%20'
> and script gives follwoing error
> bash: printf: 'M': invalid format character
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  oe-layertool-setup.sh | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
> index 5a0175d..d14ed4f 100755
> --- a/oe-layertool-setup.sh
> +++ b/oe-layertool-setup.sh
> @@ -276,12 +276,12 @@ configure_repo() {
>
>      # Check if the repo with $name was already seen.  Use the , at the end
>      # of the grep to avoid matching similar named repos.
> -    temp=`printf "$output\n" | grep -e "^$name,"`
> +    temp=`printf '%s\n' $output | grep -e "^$name,"`
>
>      if [ "x$temp" != "x" ]
>      then
>          echo "This repository ($name) has already been configured with the following values:"
> -        printf "\t$temp\n"
> +        printf '\t%s\n' $temp
>          echo "Skipping configuring duplicate repository"
>          return 1
>      fi
> @@ -928,7 +928,7 @@ then
>      then
>          mkdir -p $dir
>      fi
> -    printf "$output\n" > $outputfile
> +    printf '%s\n' $output > $outputfile
>      echo "Output file is $outputfile"
>  fi
>
> --
> 2.17.1
>

