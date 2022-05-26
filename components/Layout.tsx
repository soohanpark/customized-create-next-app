import styled from "styled-components";
import Head from "next/head";
import { ReactNode } from "react";

interface LayoutProps {
  children?: ReactNode;
}

const Wrapper = styled.div``;

function Layout({ children }: LayoutProps) {
  return (
    <Wrapper>
      <Head>
        <title>SAMLE TITLE</title>

        <meta charSet="utf-8" />
        <meta name="viewport" content="initial-scale=1.0, width=device-width" />
      </Head>
      {/* If you have a HEADER, please input here */}
      {children}
      {/* If you have a FOOTER, please input here */}
    </Wrapper>
  );
}

export default Layout;
